require 'spec_helper'

describe "Successful sign in redirects to /canvas", :type => :feature do
  before :each do
    u=User.create(email: 'user@example.com', password: 'password', name: 'denis')
  end

  it "signs me in" do
    visit '/users/sign_in'
    within("form#new_user.new_user") do
      fill_in 'user_email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_on 'Sign in'
    current_path.should == '/canvas'
  end
end
