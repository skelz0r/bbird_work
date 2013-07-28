require 'spec_helper'

describe TweetController do

  describe "GET 'print'" do
    it "returns http success" do
      get 'print'
      response.should be_success
    end
  end

end
