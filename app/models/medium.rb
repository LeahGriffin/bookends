class Medium < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }

  belongs_to :user
  has_many :comments

  validates :author, presence: true
  validates :genre, presence: true

  def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

