class ShippingAddress < ApplicationRecord
  belongs_to :order

  # Active_hash モデルのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_source


  with_options presence: true do
    # 郵便番号が必須で、数字３文字、ハイフン、数字４文字の構成であること（※現在日本の郵便番号は全て７桁）
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input 7 digits with hyphen." }
    # 発送元の地域についての情報が必須であること
    validates :delivery_source_id, numericality: { other_than: 1, message: "is invalid. must select."}
    # 住所の市町村区の情報が必須であること
    validates :city
    # 住所の番地の情報が必須であること
    validates :house_number
    # 電話番号の情報が必須であり、ハイフンなしの半角数字で入力されていること
    validates :phone_number, format: { with: /\A\d{10}\z/, message: "is invalid. Input half-width numbers without hyphens." }
    end
  end
end
