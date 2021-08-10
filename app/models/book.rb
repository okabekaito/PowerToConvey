class Book < ApplicationRecord
    paginates_per 5
    has_one_attached :image
    validates :title,presence: true,length: {maximum: 30}
    validates :author,presence: true,length: {maximum: 30}
    validates :wrapUp,presence: true,length: {maximum: 150}

    belongs_to :user
    scope :recent, ->{order(created_at: :desc)}
end
