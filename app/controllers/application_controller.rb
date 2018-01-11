class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include ApplicationHelper
  include IntelligentFeature
  require 'uri'
  
  before_action :set_globals



  private
  
  def set_globals
    @locations = Location.all
    @meetings = Meeting.all
    @services = Service.all
    @events = Event.all
    @pages = Page.all
    @top_features = featured
    
    @sorted_meetings = Meeting.in_partial.ordered_by_day_and_time.preload(:location, :service).group_by{|meeting| [meeting.service]}
  end
  
end
