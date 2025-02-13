class Subscriptions::Subscription < ApplicationRecord
  def self.polymorphic_name = 'Subscription'
  has_many :payments, as: :payable
end
