require 'rails_helper'

describe Comment do
  context "when adding a new comment" do

    it "comment not valid without a user" do
      expect(FactoryBot.build(:comment, user_id: nil)).not_to be_valid
    end

    it "comment not valid without a body" do
      expect(FactoryBot.build(:comment, body: nil)).not_to be_valid
    end

    it "comment not valid without a product" do
      expect(FactoryBot.build(:comment, product_id: nil)).not_to be_valid
    end

    it "comment not valid if rating is a string" do
      expect(FactoryBot.build(:comment, rating: "great")).not_to be_valid
    end

    it "comment not valid if rating is a decimal" do
      expect(FactoryBot.build(:comment, rating: 1.5)).not_to be_valid
    end
  end

end
