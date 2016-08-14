get '/session/new' do
  erb :'session/new'
end

post '/session' do
  @user = User.authenticate(params[:username], params[:password])

  if @user
    session[:user_id] = @user.id
    redirect :'/profile'
  else
    @message = "Credentials were bad"
    erb :'session/new'
  end
end

get '/session/logout' do
  session.clear

  @entries = Entry.most_recent

  erb :'entries/index'
end
