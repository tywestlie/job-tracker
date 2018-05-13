require 'rails_helper'

describe 'User updates an existing job' do
  it 'updates a job' do
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Spokesperson', level_of_interest: 50, city: 'Denver')
    visit company_job_path(company, job)

    click_link 'Edit'

    new_job = 'janitor'
    new_city = 'Kathmandu'
    interest_level = 100

    fill_in 'job[title]', with: new_job
    fill_in 'job[level_of_interest]', with: interest_level
    fill_in 'job[city]', with: new_city
    click_on 'Update Job'

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content(new_job)
    expect(page).to have_content(new_city)
    expect(page).to have_content(interest_level)
  end
end
