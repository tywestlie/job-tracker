class CreateJobComments < ActiveRecord::Migration[5.1]
  def change
    create_table :job_comments do |t|
      t.text :comment

      t.timestamps
    end
  end
end
