class Book < ApplicationRecord
    belongs_to :author
    validates :publication_year, numericality: { only_integer: true }
end
