class EventAttendeesController < ApplicationController
  before_action :authenticate_user!, only: [ :show, :index, :create, :destroy ]

  def index
  end

  def create
    event = Event.find(params[:event_id])
    if current_user.attending_events << event
      redirect_to event_path(event)
    else
      redirect_to event_path(event), status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    event = Event.find(params[:event_id])
    if event.attendees.destroy(params[:id])
      redirect_to event_path(event)
    else
      redirect_to event_path(event), status: :unprocessable_entity
    end
  end
end
