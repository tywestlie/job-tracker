require 'rails_helper'

describe 'user visits a dashboard page' do
  it 'sees a dashboard headline' do
    dashboard = 'JobTracker'
    visit dashboard_path

    expect(page).to have_content(dashboard)
  end

  it 'sees a list of jobs by city' do
      category = Category.create!(title: 'Dev')
      company = Company.create!(name: "ESPN")
      job1 = company.jobs.create!(title: "farmer", level_of_interest: 70, city: "Seattle", category_id: category.id)
      job2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      job3 = company.jobs.create!(title: "fisherman ", level_of_interest: 70, city: "Denver", category_id: category.id)


      visit dashboard_path

      expect(page).to have_content(job1.city)
      expect(page).to have_content(job2.city)
  end
end
