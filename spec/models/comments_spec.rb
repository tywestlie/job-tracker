require 'rails_helper'
describe Comment do
  describe'validations' do
    context 'invalid attributes' do
      it 'is invalid without a comment' do
        company = Company.create!(name: 'ESPN')
        job = company.jobs.create!(title: 'Spokesperson', level_of_interest: 50, city: 'Denver')
        comment = job.comments.create()
        expect(comment).to be_invalid
      end
    end

      context 'valid attributes' do
        it 'is valid with comment' do
          company = Company.create!(name: 'ESPN')
          job = company.jobs.create!(title: 'Spokesperson', level_of_interest: 50, city: 'Denver')
          comment = job.comments.create!(content: 'This job is so great!')
          expect(comment).to be_valid
        end
      end
  end
end
