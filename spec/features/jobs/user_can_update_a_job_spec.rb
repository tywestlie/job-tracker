require 'rails_helper'

describe 'User updates an existing job' do
  it 'updates a job' do
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Spokesperson', level_of_interest: 50, city: 'Denver')
    visit company_job_path(company, company.jobs[0])

    click_link 'Edit'

    fill_in 'job[title]', with: 'janitor'
    click_button 'Update'

    expect(current_path).to eq(company_job)
  end
end
