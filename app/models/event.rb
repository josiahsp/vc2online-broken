class Event < ApplicationRecord

	include ActiveModel::Validations
	belongs_to :location, optional: true

	validates_presence_of :title, :synopsis, :content, :start, :end
	validates :title, length: { minimum: 2, maxiumum: 30 }
	validates :synopsis, length: { minimum: 2, maximum: 300 }
	validates :price, numericality: { only_float: true }
	validates_with EventValidator
	
end
