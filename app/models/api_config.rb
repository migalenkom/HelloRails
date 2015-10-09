class ApiConfig < ActiveRecord::Base

  scope :twitter, -> { find_by_name('Twitter') }
  scope :yelp, -> { find_by_name('Yelp') }
  scope :fb, -> { find_by_name('Facebook') }

  belongs_to :user

end
