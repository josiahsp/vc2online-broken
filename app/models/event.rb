class Event < ApplicationRecord

	has_many :links
	has_many :images
	has_many :videos

	include ActiveModel::Validations
	belongs_to :location, optional: true

	validates_presence_of :title, :synopsis, :content, :start, :endtime
	validates :title, length: { minimum: 2, maxiumum: 30 }
	validates :synopsis, length: { minimum: 2, maximum: 300 }
	validates :price, numericality: { only_float: true }
	validates_with EventValidator
	
	#scopes
	scope :chronological, -> { order(:start) }
	scope :soon, -> { where('start < ?', (Time.now + 3.weeks)) }
	scope :later, -> { where('start > ?', (Time.now + 3.weeks)) }
	
end
