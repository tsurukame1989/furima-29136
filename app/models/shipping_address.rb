class ShippingAddress < ApplicationRecord
  belongs_to :order

  # Active_hash モデルのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_source
  
end
