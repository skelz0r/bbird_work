require 'spec_helper'

describe "Successful sign in redirects to /canvas", :type => :feature do

  before :each do
    @u=User.create(email: 'user@example.com', password: 'password', name: 'denis')
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

  it "home#index redirects users signed in to /canvas" do
    login_as(@u, :scope => :user)
    visit '/'
    current_path.should == '/canvas'
  end

  it "canvas#index is not accessible if not signed in" do
    visit '/canvas'
    current_path.should == '/users/sign_in'
  end

end
