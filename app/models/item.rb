class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  belongs_to :category
  belongs_to :status
  belongs_to :bearer
  belongs_to :area
  belongs_to :number
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :description
  end
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :bearer_id
    validates :area_id
    validates :number_id
  end
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, allow_blank: true },
                    numericality: {
                      allow_blank: true,
                      only_integer: true,
                      greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
                    }
end
