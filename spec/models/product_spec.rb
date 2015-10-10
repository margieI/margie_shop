require 'rails_helper'

describe Product do

  context "when the product has comments" do
    
    before do
      #If you do not include FactoryGirl::Syntax::Methods in your test suite, 
      #then all factory_girl methods will need to be prefaced with FactoryGirl.
      #here you put your code to generate test content
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)

      #@product = Product.create(:name => "race bike")
      #@user = User.create(:first_name => "John", :last_name => "Doe", :email => "spec_test@test.com", :password => "12345test7")
      @comment = FactoryGirl.create(:comment, rating:  "1")
      @comment2 = FactoryGirl.create(:comment, rating: "3")
      @comment3 = FactoryGirl.create(:comment, rating: "5")

      #@product.comments.create(:rating => 1, :user => @user, :body => "Awful bike!")
      #@product.comments.create(:rating => 3, :user => @user, :body => "Fine")
      #@product.comments.create(:rating => 5, :user => @user, :body => "Amazing")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end

  context "product with description but no name" do

    before do
      @product = Product.create(:name => nil, :description => "race bike")
    end

    it "will not pass validation without a name" do
      expect(@product).not_to be_valid
    end
  end
end