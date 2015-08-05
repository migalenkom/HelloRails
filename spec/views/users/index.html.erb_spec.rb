require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
       User.create!(name:'Eugene', email:'test6@local',password: 'test', password_confirmation:'test'),
       User.create!(name:'Eugene', email:'test7@local',password: 'test', password_confirmation:'test')
    ])
  end

  it "renders a list of users" do
     # render
  end
end
