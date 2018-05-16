require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: 'Developer')
    job = company.jobs.create!(title: "Backend Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit job_path(job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "a user can link to a job by city index" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: 'Developer')
    job = company.jobs.create!(title: "Backend Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    denver_path = "/companies/#{company.id}/jobs?city=Denver"

    visit job_path(job)

    click_on("Denver")

    expect(current_path).to eq(company_jobs_path(company))
  end

  scenario 'user sees city job banner' do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: 'Developer')
    company.jobs.create!(title: "Backend Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    banner = "Denver Jobs"
    denver_path = "/companies/#{company.id}/jobs?city=Denver"

    visit denver_path

    expect(page).to have_content(banner)
  end
end
