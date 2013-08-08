require 'spec_helper'

describe "canvas" do

  before(:each) do
    u=User.create(email: 'user@example.com', password: 'password', name: 'denis')
    login_as(u, :scope => :user)
    9.times do |acc|
      random_string = (0...8).map{(65+rand(26)).chr}.join
      Block.create(id_case: (acc+1), content: random_string) 
    end
    visit '/canvas'
    current_path.should == '/canvas'
  end

  it "each 9 <td> contains respectively contents of 9 blocks" do
    all("td").each_with_index do |td, index|
      td.should have_content(Block.find_by_id_case(index+1).content)
    end
  end

  it "textarea in block 1 inserts changes in database" do
    within("form#block_1") do
      fill_in 'block_content', :with => '123456789'
      click_button('Save')
    end
    Block.find_by_id_case(1).content.should eq('123456789')
  end

end
