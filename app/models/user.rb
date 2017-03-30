class User < ApplicationRecord
	
    mount_uploader :image, ImageUploader
    has_secure_password
    has_many :user_events, dependent: :destroy
    has_many :events, through: :user_events
    has_many :posts, dependent: :destroy
    


	validates_uniqueness_of :email
    

def self.from_omniauth(auth)
    @user = User.find_by(email: auth.info.email)
    unless @user
        @user = User.create!(provider: auth.provider, uid: auth.uid, email:auth.info.email,password_digest: auth.uid)
        @user.update_attributes(name: auth.info.name,oauth_token: auth.credentials.token,ouath_expires_at: Time.at(auth.credentials.expires_at))
    end
    return @user
  end


end
