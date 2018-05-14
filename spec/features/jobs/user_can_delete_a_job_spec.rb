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

    visit job_path(job_2)

    expect(page).to have_content(job_2.level_of_interest)
    expect(page).to have_content(city_2)

    click_on 'Delete'

    expect(current_path).to eq(company_jobs_path(job_1.company))
    expect(page).to have_content(title_1)
    expect(page).to_not have_content(title_2)
  end
end
