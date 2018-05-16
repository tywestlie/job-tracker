require 'rails_helper'

describe Contact, type: :model do
  describe "validations" do
    it {should validate_presence_of(:full_name, :position, :email, :company)}
  end
end
