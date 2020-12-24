class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  validates :name, presence: true, length: { maximum: 255 }

  mount_uploader :icon, ImageUploader

  has_many :groups, foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :groups, through: :assigns

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.name = auth.info.name
        user.email = dummy_email(auth)
        user.provider = auth.provider
        user.uid = auth.uid
        user.password = Devise.friendly_token[0,20]
      end
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "take"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

end
