require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(name:'Eugene', email:'test10@local',password: 'test', password_confirmation:'test'))
  end

  it "renders the edit user form" do
    # render
    #
    # assert_select "form[action=?][method=?]", user_path(@user), "post" do
    # end
  end
end
