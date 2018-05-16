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

  it 'can see when the comment was created' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    comment = job.comments.create!(content:'this job is so great')

    visit job_path(job)

    expect(page).to have_content(comment.created_at)
  end

  it 'can see the newest comment first' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    comment1 = job.comments.create!(content:'this job is so great')
    comment2 = job.comments.create!(content:'this job is so great')

    visit job_path(job)

    within('li:nth-child(1)') do
      expect(page).to have_content(comment2.created_at)
    end
    within('li:nth-child(2)') do
      expect(page).to have_content(comment1.created_at)
    end

  end
end
