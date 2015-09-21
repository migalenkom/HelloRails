require 'rails_helper'
require 'pry-rails'

RSpec.describe Api::V1::UsersController, type: :controller do

  describe "Users API" do
    it 'sends a list of users' do
      get :index
      expect(response).to be_success            # test for the 200 status-code
      json = JSON.parse(response.body)
      expect(json.length).to eq(6) # check to make sure the right amount of messages are returned
    end
  end
end
