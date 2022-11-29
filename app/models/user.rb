class User < ApplicationRecord
  def create_stripe_customer
    customer = Stripe::Customer.create({
      email: self.email,
    })
    self.stripe_customer_id = customer.id
    self.save
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sales
end
