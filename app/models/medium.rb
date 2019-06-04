class Medium < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }

  belongs_to :user
  has_many :comments

  validates :author, presence: true
  validates :genre, presence: true
end
