require 'bcrypt'
class User < ActiveRecord::Base

  has_many :entries

  validates :username, :password, { presence: true }
  validates :username, { uniqueness: true }

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, entered_password)
    user = User.find_by(username: username)

    if user && user.password == entered_password
      return user
    else
      return nil
    end
  end

end
