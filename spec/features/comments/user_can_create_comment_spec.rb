require 'rails_helper'

describe 'user visits jobs show page' do
  it 'can create a comment' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    content = 'This job is so great!'

    visit job_path(job)

    fill_in :comment_content, with: content
    click_on 'Create Comment'

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content(content)
  end
end
