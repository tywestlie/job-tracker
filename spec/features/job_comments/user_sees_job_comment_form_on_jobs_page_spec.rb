require 'rails_helper'
describe 'user vists job show page' do
  xit 'can see comment section title' do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit
    save_and_open_page
  end
end
