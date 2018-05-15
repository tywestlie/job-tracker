require 'rails_helper'

describe 'user visits jobs show page' do
  it 'can create a comment' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    comment = 'This job is so great!'

    visit job_path(job)

    fill_in :comment, with: comment

    expect(page).to have_content(comment)
  end
end
