class JobComment < ApplicationRecord
  validates :name, presence: true
  belongs_to :job
end
