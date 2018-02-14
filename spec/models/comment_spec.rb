require 'rails_helper'

describe Comment do
  context "when adding a new comment" do
    it "comment not valid without a user" do
      expect(Comment.new(body: "i love green", product_id: 1, rating: 2)).not_to be_valid
    end
  end

end
