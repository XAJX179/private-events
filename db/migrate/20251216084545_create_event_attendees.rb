class CreateEventAttendees < ActiveRecord::Migration[8.0]
  def change
    create_table :event_attendees, id: false do |t|
      t.references :attending_event, null: false, foreign_key: { to_table: :events }
      t.references :attendee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
