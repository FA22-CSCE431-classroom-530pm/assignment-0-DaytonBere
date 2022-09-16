class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :price, presence: true, numericality: { only_integer: false, greater_than_or_equal_to: 0, less_than_or_equal_to: (2**(0.size * 8 -2) -1)}
    validates :published_date, presence: { message: ": Date entered must be a valid date" }
end
