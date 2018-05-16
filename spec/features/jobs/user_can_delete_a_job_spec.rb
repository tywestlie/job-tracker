require 'rails_helper'

describe 'user deletes a job' do
  it 'should displays all jobs without the deleted job' do
    company = Company.create!(name: 'ESPN')

    category = Category.create(title: 'Developer')

    job_1 = company.jobs.create!(title: 'Rodeo Clown',
                                level_of_interest: 98,
                                city: 'Denver',
                                category_id: category.id)
    job_2 = company.jobs.create!(title: 'Cheerleader',
                                level_of_interest: 2,
                                city: 'Portland',
                                category_id: category.id)


    visit job_path(job_2)

    expect(page).to have_content(job_2.level_of_interest)
    expect(page).to have_content(job_2.city)

    click_on 'Delete'

    expect(current_path).to eq(company_jobs_path(job_1.company))
    expect(page).to have_content(job_1.title)
    expect(page).to_not have_content(job_2.title)
  end
end
