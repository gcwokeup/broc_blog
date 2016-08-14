get '/users/new' do

  erb :'/users/new'
end

post '/users' do

  @user = User.new(params[:user]) #create new user

  if @user.save #saves new user or returns false if unsuccessful
    redirect '/session/new' #links back to users index page
  else
    erb :errors #shows an errors view you define
  end
end

get '/profile' do
  @user = User.find(session[:user_id])
  erb :'/users/show'
end

get '/users/:id/entries' do
  @user = User.find(params[:id])
  erb :'/users/index'
end
