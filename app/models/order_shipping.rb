class OrderShipping

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :delivery_source_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    # クレジットカード情報（token)が必須であること
    validates :token
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

  def save
    ShippingAddress.create(postal_code: postal_code, delivery_source_id: delivery_source_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
    Order.cretae(token: token)
  end
end