class Feature < ApplicationRecord
  include FeaturesHelper

  belongs_to :event, optional: true
  belongs_to :page, optional: true
  
  validates_presence_of :start, :endtime, :level
  
  validates_with FeatureValidator
  
  scope :pages, -> { where(:page_id.present?) }
  scope :events, -> { where(:event_id.present?) }
  scope :active, -> { where(:live => true) }
  scope :activated, -> { where('start <= ?', Time.now) }
  scope :not_expired, -> { where('endtime > ?', Time.now) }
  scope :prioritized, -> { order(level: :desc) }
  scope :for_page, -> { (page_id.present? && event_id.blank?) ? true : false }
  
  
  def for_page?
    (page_id.present? && event_id.blank?) ? true : false
  end
  
  def for_event?
    (page_id.blank? && event_id.present?) ? true : false
  end
  
  def for_youtube?
    self.class = Hash ? true : false
  end
  
end