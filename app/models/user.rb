class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 10 }
  validates :bio, length: { maximum: 10 }

  has_many :posts, dependent: :destroy
end
