class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :show, :new, :create ]

  def index
    if current_user
      @events = current_user.invited_events
    end
  end

  def show
    @event = Event.find(params[:id])
    if @event.invited_user_ids.include?(current_user.id)
    else
      flash.now[:alert] = "Not Authorized"
      render :index, status: 403
    end
  end

  def new
    @event = Event.new
  end

  def create
    event = current_user.events.build(event_params)
    if event.save!
      event.invited_users << current_user
      redirect_to events_path
    else
      flash.now[:alert] = "Invalid"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.expect(event: [ :name, :location, :date ])
  end
end
