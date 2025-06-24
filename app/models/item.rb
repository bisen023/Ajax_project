class Item < ApplicationRecord
	  scope :by_category, ->(cat) { where(category: cat) if cat.present? }
	  paginates_per 10
end
