require 'rails_helper'
describe 'user vists job show page' do
  it 'can see comment section title' do
    visit job_path()
  end
end
