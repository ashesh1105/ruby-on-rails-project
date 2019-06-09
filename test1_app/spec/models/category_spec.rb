require 'rails_helper'


RSpec.describe Category, type: :model do

    # You can do before or after with arguments like :each, :all
    before(:each) do
        @category = Category.new(name: "sports")
    end

    it "should be a valid category" do
        expect @category.valid?
    end

    # tests validates :name, presence: true
    it "should not has empty name for category" do
        @category.name = " "
        expect(@category.valid?).to be false
    end

    # tests validates :name, uniqueness
    it "should have unique names" do
        @category.save
        category2 = Category.new(name: "sports")
        expect(category2.valid?).to be false
    end

    # tests uniqueness: { case_sensitive: false } for name field
    it "should have unique names either case" do
        @category.save
        category2 = Category.new(name: "Sports")
        expect(category2.valid?).to be false
    end
    
    # tests name field to not be more than 25 characters
    it "should not has too long name" do
        @category.name = "a" * 26
        expect(@category.valid?).to be false
    end

    # tests name field to not be less than 3 fields
    it "should not has too short name" do
        @category.name = "d" * 2
        expect(@category.valid?).to be false
    end
  
end