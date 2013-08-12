require 'spec_helper'

describe "canvas" do

  before(:each) do
    u=User.create(email: 'user@example.com', password: 'password', name: 'denis')
    login_as(u, :scope => :user)
    @c=Canvas.create(title: "Noisy Keychains", user: u)
    visit '/canvas/'+@c.id.to_s
  end

  it "each 9 <td> contains respectively contents of 9 blocks" do
    all("td").each_with_index do |td, index|
      td.should have_content(@c.content_of_block(index+1))
    end
  end

  it "textareas make changes in database" do
    all("td").each_with_index do |td, index|
      within("form#block_"+(index+1).to_s) do
        fill_in 'block_content', :with => '123456789'+index.to_s
        click_button('Save')
      end
      @c.content_of_block(index+1).should have_content('123456789'+index.to_s)
    end
  end

end
