class Order < ActiveRecord::Base
  belongs_to :user
  before_save :calculator
  validates  :address, :phone, presence: true
  validates  :address, :phone, length: { minimum: 3 }
  has_many :line_items, dependent: :destroy

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def calculator
    self.total = line_items.to_a.sum{|l| l.product.price * l.quantity}
  end
end
