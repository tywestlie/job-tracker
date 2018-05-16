require 'rails_helper'

describe 'user visits a dashboard page' do
  it 'sees a dashboard headline' do
    dashboard = 'JobTracker'
    visit dashboard_path

    expect(page).to have_content(dashboard)
  end

  # xit 'sees a list of jobs by city' do
  #     company = Company.create!(name: "ESPN")
  #     job1 = company.jobs.create!(title: "farmer", level_of_interest: 70, city: "Seattle")
  #     job2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
  #     job3 = company.jobs.create!(title: "fisherman ", level_of_interest: 70, city: "Denver")
  #
  #
  #     visit dashboard_path
  #
  #     expect(page).to have_content(job1.city)
  #     expect(page).to have_content(job2.city)
  #     expect(page).to have_content(job3.city)
  # end
end
