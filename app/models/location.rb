class Location < ApplicationRecord

	has_many :meetings
	
	def meetings_formatted_for_partial(location)
		services = Service.ordered_by_priority
		#meetings = all meetings ordered by service type
		meetings = Marshal
		
	end
	
end
