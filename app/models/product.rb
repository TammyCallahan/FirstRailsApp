class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, :description, :colour, :price, presence: true

  def self.search(search_term)
    if Rails.env.production?
      like_term = "ilike"
    else
      like_term = "LIKE"
    end
    Product.where("name #{like_term} ?", "%#{search_term}%")
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def view_count
    $redis.GET("product:#{id}") # equivalent to 'Get product:1'
  end

  def viewed!
    $redis.INCR("product:#{id}") # increments by 1
  end
end
