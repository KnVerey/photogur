class Photo < ActiveRecord::Base

	belongs_to :collection

	validates :title, presence: true
	validates :artist, presence: true
	validates :url, presence: true

end
