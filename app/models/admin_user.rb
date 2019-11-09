class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    email_split = data['email'].split("@")
    if email_split[1] == "npptw.org"
      user = where(email: data['email']).first
      if user.blank?
        user = create(email: data['email'], password: 123456)
        user
      else
        user
      end
    else  
      redirect_to root_path
    end
  end
end
