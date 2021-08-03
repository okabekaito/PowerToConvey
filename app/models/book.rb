class Book < ApplicationRecord
    validates :title,presence: true,length: {maximum: 30}
    validates :author,presence: true,length: {maximum: 30}
    validates :wrapUp,presence: true,length: {maximum: 150}

    belongs_to :user
    scope :recent, ->{order(created_at: :desc)}
end
