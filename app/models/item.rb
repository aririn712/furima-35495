class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :bearer
  belongs_to :area
  belongs_to :number
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :bearer_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :number_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
                    }
end
