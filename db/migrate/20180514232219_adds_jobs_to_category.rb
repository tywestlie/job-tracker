class AddsJobsToCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :categories, :job, index: true, foreign_key: true
  end
end
