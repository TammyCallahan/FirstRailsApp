class Product < ApplicationRecord
  has_many :orders
  def self.search(search_term)
    if Rails.env.production?
      like_term = "ilike"
    else
      like_term = "LIKE"
    end
    Product.where("name #{like_term} ?", "%#{search_term}%")
  end
end
