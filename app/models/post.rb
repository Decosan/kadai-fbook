class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :favorite_users,through: :favorites,source: :user
  validates :title,presence: true,length: {maximum: 25}
  validates :content,presence: true,length: {maximum: 255}
end
