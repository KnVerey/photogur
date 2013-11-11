class Collection < ActiveRecord::Base
	has_many :photos

	validates :name, presence: true
end
