class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include ApplicationHelper
  require 'uri'
  
  $locations = Location.all
  $meetings = Meeting.all
  $services = Service.all
  
  
  $sorted_meetings = Meeting.in_partial.preload(:location, :service).group_by{|meeting| [meeting.service]}
  
end
