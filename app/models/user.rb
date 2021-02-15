class User < ApplicationRecord
  has_many :items
  has_many :comments
  has_many :orders
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    # ニックネームは必須である事
    validates :nickname
    # emailは必須、一意性で、＠を含まなければいけない事
    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "is invalid. Input '@'." }
    # passwordは必須、６文字以上で、半角英数字の混合である事
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,100}\z/, message: "is invalid. Input half-width both characters & numbers." }

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." } do
      # 名前は必須で,全角ひらがな、カタカナ、漢字である事
      validates :first_name
      # 苗字は必須で,全角ひらがな、カタカナ、漢字である事
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." } do
      # 名前の読み仮名は必須で、全角カタカナである事
      validates :first_name_reading
      # 苗字の読み仮名は必須で、全角カタカナである事
      validates :last_name_reading
    end

    # 誕生日は必須である事
    validates :birthday
  end
end
