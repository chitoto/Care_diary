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

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :boards, dependent: :destroy

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
      user.name = "guest_user"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
  active_relationships.find_by(followed_id: other_user.id).destroy
end

end
