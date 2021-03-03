class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address
  # tokenの値を保存する
  atter_accesor :token
end
