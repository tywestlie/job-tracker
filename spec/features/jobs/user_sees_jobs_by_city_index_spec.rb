require 'rails_helper'

describe 'user visits jobs by city index' do
  it 'sees a denver jobs index' do
    category = Category.create!(title: 'Dev')
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "farmer", level_of_interest: 70, city: "Seattle", category_id: category.id)
    job2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job3 = company.jobs.create!(title: "fisherman ", level_of_interest: 70, city: "Denver", category_id: category.id)
    denver_path = "/companies/#{company.id}/jobs?city=Denver"

    visit denver_path


    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content(job2.title)
    expect(page).to have_content(job2.city)
    expect(page).to have_content(job3.title)
    expect(page).to have_content(job3.city)
  end
end
