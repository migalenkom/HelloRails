class YpagesController < ApplicationController

def index
  @business = create_client.business('pleasant-limo-llc-san-francisco-15')
end

  private

  def create_client
    @yelp_client ||=
        Yelp::Client.new({consumer_key: 'UGwCuB2oNd3s3G1MUDwGxg',
                          consumer_secret: 'rvY_Cdx-5Y4oTTEGUmE_RJTk3Jc',
                          token: 'UZerQ0YR9MSEokBX4-2UkEYXnjepjtRP',
                          token_secret: 'fsVMzGKXQ8PmATJOcYMGa0Yi8mE'
                          })
  end

end
