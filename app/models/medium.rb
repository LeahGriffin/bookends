class Medium < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }

  belongs_to :user
  has_many :comments
  geocoded_by :address
  after_validation :geocode

  validates :author, presence: true
  validates :genre, presence: true

  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  #   else
  #     find(:all)
  #   end
  # end
  def self.search(search)
  if search
    self.where("title like ?", "%#{search}%")
  else
    self.all
  end
end
end

