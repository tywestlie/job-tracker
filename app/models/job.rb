class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :comments

  def sort_comments
    comments.order(created_at: :DESC)
  end
end
