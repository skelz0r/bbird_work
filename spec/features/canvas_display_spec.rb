require 'spec_helper'

describe "canvas" do

  before(:each) do
    u=User.new(email: 'user@example.com', password: 'password', name: 'denis')
    @c=Canvas.create(title: "Noisy Keychains", user: u)
    login_as(u, :scope => :user)
    visit '/canvas/'+@c.id.to_s
  end

  it "each 9 <td> contains respectively contents of 9 blocks" do
    all("td").each_with_index do |td, index|
      td.should have_content(@c.content_of_block(index+1))
    end
  end

  it "textareas make changes in database", :js => true do
    all("td").each_with_index do |td, index|
      within("form#block_"+(index+1).to_s) do
        fill_in 'block_content', :with => '123456789'+index.to_s
      end
      page.driver.execute_script("document.getElementById('block_#{(index+1).to_s}').submit();")
      @c.content_of_block(index+1).should have_content('123456789'+index.to_s)
    end
  end

end
