module ApplicationHelper

	def meetings_grouped_by_weekday(meetings)
		# Receives array of meetings and outputs array of strings in format of "WKDY TIME, TIME and TIME"
		
		formatted_meetings = []
		
		meetings.each do |meeting|
			day = Regexp.new Date::ABBR_DAYNAMES[meeting.weekday]
			
			if formatted_meetings.any? { |val| day =~ val } == false
				# If weekday is not already listed in formatted_meetings, add a string in the format of "WKDY TIME" to the array
				formatted_meetings << "#{Date::ABBR_DAYNAMES[meeting.weekday]} #{meeting.time.strftime("%-l:%M %p")}"
			else
				s = formatted_meetings.find_index{ |d| d.include? Date::ABBR_DAYNAMES[meeting.weekday]}
				if formatted_meetings[s].include? "and"
					# If weekday is listed and already has an "and" (signifying multiple times in string), swap out all "and"s for commas and append "and TIME"
					statement = formatted_meetings[s]
					statement.gsub!(" and", ",")
					statement += " and #{meeting.time.strftime("%-l:%M %p")}"
					formatted_meetings[s] = statement
				else
					# If weekday is listed but with only one time, append "and TIME"
					formatted_meetings[s] = "#{formatted_meetings[s]} and #{meeting.time.strftime("%-l:%M %p")}"
				end
			end
		end
		return formatted_meetings
	end
	
	
	
end
