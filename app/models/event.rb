class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :location, presence: true, length: { minimum: 15 }
  validates :date, presence: true

  belongs_to :creator, class_name: "User"
  has_many :event_attendees, dependent: :destroy,
            foreign_key: "attending_event_id"
  has_many :attendees, through: :event_attendees, class_name: "User"
  has_many :event_invitations, dependent: :destroy, foreign_key: "invited_event_id"
  has_many :invited_users, through: :event_invitations, class_name: "User"

  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date >= ?", Date.today) }
end
