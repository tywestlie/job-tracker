require 'rails_helper'

describe Job do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        job = Job.new(level_of_interest: 80, description: 'Wahoo', city: 'Denver')
        expect(job).to be_invalid
      end

      it 'is invalid without a level of interest' do
        job = Job.new(title: 'Developer', description: 'Wahoo', city: 'Denver')
        expect(job).to be_invalid
      end

      it 'is invalid without a city' do
        job = Job.new(title: 'Developer', description: 'Wahoo', level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a title, level of interest, and company' do
        company = Company.new(name: 'Turing')
        job = Job.new(title: 'Developer', level_of_interest: 40, city: 'Denver', company: company)
        expect(job).to be_valid
      end
    end
  end

  describe 'relationships' do
    it {should belong_to(:company)}
  end

  describe 'instance methods' do
    it 'sorts job comments newest first' do
      company = Company.create(name: 'Turing')
      job = Job.create(title: 'Developer', level_of_interest: 40, city: 'Denver', company: company)
      comment1 = job.comments.create(content: 'Woweeeeeeeee!')
      comment2 = job.comments.create(content: 'NOOOOOOOOO!')

      sorted = job.sort_comments
      expect(sorted[0].content).to eq(comment2.content)
    end
  end
end
