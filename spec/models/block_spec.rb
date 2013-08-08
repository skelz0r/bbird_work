require 'spec_helper'

describe Block do

  before(:each) do
    @attr = {content: "Hello everyone", id_case: 1 }
  end

  it "must be valid" do
    Block.new(@attr).should be_valid
  end

  describe "#id_case" do
    it "is not valid if it has no id_case" do
      @attr[:id_case]=nil
      Block.new(@attr).should_not be_valid
    end

    it "is not valid if id_case already in db" do
      Block.create(@attr)
      Block.new(@attr).should_not be_valid
    end

  end
end
