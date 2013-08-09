require 'spec_helper'

describe Canvas do

  before(:each) do
    @attr_user = { name: "me", email: "me@gmail.com", login_twitter: "thisisme", password: "12345678" }
    @attr={title: "Noisy Keychains", user: User.new(@attr_user)}
  end

  describe "blocks" do

    before(:each) do
      @c=Canvas.create(@attr)
    end

    context "at creation" do
      it "are 9" do
        b=Block.where(canvas_id: @c.id)
        b.should have(9).items
      end
    end

    it "each have different id_case" do
      b=Block.where(canvas_id: @c.id).map(&:id_case)
      b.uniq.should == b
    end
  end

  describe "user" do
    it "is present" do
      @attr[:user]=nil
      Canvas.new(@attr).should_not be_valid
    end
  end
end
