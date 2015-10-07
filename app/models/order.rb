# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  address    :text
#  phone      :string(255)
#  total      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  state      :string(255)
#

class Order < ActiveRecord::Base
  STATES = %w(new process pay_ok pay_error).freeze
  belongs_to :user
  before_save :calculator
  after_create :order_created
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
    self.total = line_items.to_a.sum{ |l| l.product.price * l.quantity }
  end

  def calculator_rub
    line_items.to_a.sum{ |l| l.product.p_price(l.product.p_price.model) * l.quantity }
  end

  state_machine :state, initial: :new do

    event :process do
      transition new: :process
    end

    event :pay_ok do
      transition process: :pay_ok
    end

    event :pay_error  do
      transition process: :pay_error
    end
  end

  def calculator_rub
    self.total = line_items.to_a.sum{|l| l.product.p_price(l.product.model) * l.quantity}
  end

  private

  def send_client
    OrdersMailer.send_client(self).deliver
  end

  def send_shop
    OrdersMailer.send_shop(self).deliver
  end

  def order_created
    send_client
    send_shop
  end
end
