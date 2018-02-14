require 'rails_helper'

describe User do
  context "when adding a new user" do
    it "user not valid without a password" do
      expect(User.new(email: "hello@tammycallahan.com")).not_to be_valid
    end
  end
  
end
