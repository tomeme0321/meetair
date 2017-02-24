class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
  has_many :posts
  mount_uploader :avatar, AvatarUploader

  def update_with_password(params, *options)
    if provider.blank?
      super
    else
      params.delete :current_password
      update_without_password(params, *options)
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
      user = User.find_by(email: auth.info.email)

      unless user
        user = User.new(
            name:     auth.extra.raw_info.name,
            provider: auth.provider,
            uid:      auth.uid,
            email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
            image_url:   auth.info.image,
            password: Devise.friendly_token[0, 20]
        )
        user.skip_confirmation!
        user.save(validate: false)
      end
      user
    end
  end
