class Order < ApplicationRecord
    has_many :order_details
    has_one_attached :image
end
