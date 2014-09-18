class User < ActiveRecord::Base
  has_secure_password
  mount_uploader :avatar, AvatarUploader

  def self.authenticate(email, password)
  	user = User.find_by(email: email)
  	user && user.authenticate(password)
  end
end
