class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.city_select(city)
    where(city: city)
  end

  def self.city_count
    select('jobs.city, count(jobs.id) as job_count').group('jobs.city').order('job_count')
  end

end
