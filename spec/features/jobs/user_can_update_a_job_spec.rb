require 'rails_helper'

describe 'User updates an existing job' do
  it 'updates a job' do
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Spokesperson', level_of_interest: 50, city: 'Denver')
    visit company_job_path(company, job)

    click_link 'Edit'


    fill_in 'job[title]', with: 'janitor'
    fill_in 'job[level_of_interest]', with: 100
    fill_in 'job[city]', with: 'Kathmandu'
    click_on 'Update Job'

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content('janitor')
    expect(page).to have_content('Kathmandu')
    expect(page).to have_content(100)
  end
end
