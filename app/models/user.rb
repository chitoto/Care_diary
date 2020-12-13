class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          # :confirmable, :omniauthable,

  validates :name, presence: true

  mount_uploader :icon, ImageUploader

  has_many :groups, foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :groups, through: :assigns
  has_many :pets, dependent: :destroy
  belongs_to :keep_group, optional: true, class_name: 'Group', foreign_key: :keep_group_id

  def self.find_or_create_by_email(email)
      user = find_or_initialize_by(email: email)
      if user.new_record?
        user.password = generate_password
        user.save!
        AssignMailer.assign_mail(user.email, user.password).deliver
      end
      user
    end

end
