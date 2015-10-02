class YpagesController < ApplicationController


def index
  @business = Yelp.client.business('pleasant-limo-llc-san-francisco-15')
end

end
