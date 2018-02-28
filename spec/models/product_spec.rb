require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "race bike", description: "bike desc", colour: "purple", price: 1.5) }
    let(:user) { User.create!(email: "hello@tammycallahan.com", password: "password") }
    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end
  end

  context "when adding a new product" do
    it "product not valid without a name" do
      expect(FactoryBot.build(:product, name: nil)).not_to be_valid
    end

    it "product not valid without a description" do
      expect(FactoryBot.build(:product, description: nil)).not_to be_valid
    end

    it "product not valid without a colour" do
      expect(FactoryBot.build(:product, colour: nil)).not_to be_valid
    end

    it "product not valid without a price" do
      expect(FactoryBot.build(:product, price: nil)).not_to be_valid
    end
  end

end
