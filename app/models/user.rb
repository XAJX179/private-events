class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { minimum: 4 }

  has_many :events, dependent: :destroy,
            foreign_key: "creator_id"
  has_many :event_attendees, dependent: :destroy,
            foreign_key: "attendee_id"
  has_many :attending_events, through: :event_attendees, class_name: "Event"
  has_many :event_invitations, dependent: :destroy, foreign_key: "invited_user_id"
  has_many :invited_events, through: :event_invitations, class_name: "Event"
end
