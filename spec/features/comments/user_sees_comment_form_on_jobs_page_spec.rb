require 'rails_helper'

describe 'user vists job show page' do
  it 'can see comment section title' do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: 'Developer')
    job = company.jobs.create!(title: "Backend Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit job_path(job)

    expect(page).to have_content("Comments")
  end
end
