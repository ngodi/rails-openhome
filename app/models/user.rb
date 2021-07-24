class User < ApplicationRecord
  has_many :rooms
  has_many :reservations
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable,
         :omniauthable, :omniauthable, omniauth_providers: %i[facebook]

  validates :fullname, presence: true, length: {maximum: 50}

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, fullname: auth.info.name, email: auth.info.email, image: auth.info.image, password: Devise.friendly_token[0, 20])
      user
  end

end
