class Post < ApplicationRecord
  validates :content         , presence:true, presence: { message: "can't be blank" }

  belongs_to :user
  has_many :likes
end
