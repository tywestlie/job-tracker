require 'rails_helper'

describe 'user deletes a job' do
  it 'should displays all jobs without the deleted job' do
    company = Company.create!(name: 'ESPN')

    title_1 = 'Rodeo Clown'
    city_1 = 'Denver'
    interest_level_1 = 98

    title_2 = 'Cheerleader'
    city_2 = 'Portland'
    interest_level_2 = 2

    job_1 = company.jobs.create!(title: title_1,
                                level_of_interest: interest_level_1,
                                city: city_1)
    job_2 = company.jobs.create!(title: title_2,
                                level_of_interest: interest_level_2,
                                city: city_2)

    visit company_job_path(company, job_2)
    # save_and_open_page
    click_on 'Delete'

    expect(current_path).to eq(company_job_path(company, job_1))
    expect(page).to have_content(title_1)
    expect(page).to have_content(job_1.level_of_interest)
    expect(page).to have_content(city_1)
    expect(page).to_not have_content(title_2)
    expect(page).to_not have_content(job_2.level_of_interest)
    expect(page).to_not have_content(city_2)
  end
end
