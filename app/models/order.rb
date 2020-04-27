class Order < ApplicationRecord
    has_many :order_detail
    has_many :order_user
    has_one_attached :image
end
