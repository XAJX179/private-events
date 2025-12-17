class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendees, dependent: :destroy,
            foreign_key: "attending_event_id"
  has_many :attendees, through: :event_attendees, class_name: "User"

  def self.past
    Event.where("date < ?", Date.today)
  end

  def self.upcoming
    Event.where("date >= ?", Date.today)
  end
end
