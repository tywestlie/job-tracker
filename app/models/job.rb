class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :comments

  def self.city_select(city)
    where(city: city)
  end

end
