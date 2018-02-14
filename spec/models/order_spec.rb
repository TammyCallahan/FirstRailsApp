require 'rails_helper'

describe Order do
  context "when creating a new order" do
    it "order not valid without a user" do
      expect(Order.new(product_id: 1, total: 2.0)).not_to be_valid
    end
  end

end
