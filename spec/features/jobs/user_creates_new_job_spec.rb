require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = Category.create(title: 'Developer')
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Backend Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select "Developer"

    click_button "Create"
# save_and_open_page
    expect(current_path).to eq("/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
