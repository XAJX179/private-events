class EventInvitation < ApplicationRecord
  belongs_to :invited_event, class_name: "Event"
  belongs_to :invited_user, class_name: "User"
end
