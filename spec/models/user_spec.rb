require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  before :example do
    sign_in my_user
  end    

  describe "attributes" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should define_enum_for(:role).with([:standard, :premium, :admin]) }

  end
end
