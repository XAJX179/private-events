class EventAttendee < ApplicationRecord
  belongs_to :attending_event, class_name: "Event"
  belongs_to :attendee, class_name: "User"
end
