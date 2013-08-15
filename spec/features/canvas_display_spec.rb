require 'spec_helper'

feature "canvas" do

  background do
    u=User.new(email: 'user@example.com', password: 'password', name: 'denis')
    @c=Canvas.create(title: "Noisy Keychains", user: u)
    login_as(u, :scope => :user)
    visit '/canvas/'+@c.id.to_s
  end

  after(:each) do
    Warden.test_reset!
  end

  scenario "each 9 <td> contains respectively contents of 9 blocks" do
    all("td").each_with_index do |td, index|
      td.should have_content(@c.content_of_block(index+1))
    end
  end

  scenario "if js active, no submit button", :js => true

  (1..9).each do |index|
    scenario "textareas make changes in database for the #{index.ordinalize} block", :js => true do
      within("form#block_"+index.to_s) do
        fill_in 'block_content', :with => '123456789'+index.to_s
        click_on "Submit"
      end
      if index == 9
        print page.html
      end
      @c.content_of_block(index).should have_content('123456789'+index.to_s)
    end
  end
end
