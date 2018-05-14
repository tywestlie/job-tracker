require 'rails_helper'
describe 'user vists job show page' do
  it 'can see comment section title' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit job_path(job)

    expect(page).to have_content("Comments")
  end
end
