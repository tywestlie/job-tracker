require 'rails_helper'
describe JobComment do
  describe'validations' do
    context 'invalid attributes' do
      it 'is invalid without a comment' do
        job_comment = JobComment.new()
        require 'pry'; binding.pry
        expect(job_comment).to be_invalid
      end

      context 'valid attributes' do
        it 'is valid with comment' do
          job_comment = JobComment.new(comment: 'This job is so great!')
          expect(job_comment).to be_valid
        end
      end
    end
  end
end
