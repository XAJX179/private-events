class EventInvitationsController < ApplicationController
  def new
  end

  def create
    event = Event.find(params[:event_id])
    invite_user = User.where(name: params[:name])
    event.invited_users << invite_user
    if event.save! && !invite_user.empty?
      redirect_to event_path(event)
    else
      flash.now[:alert] = "Invalid User"
      render :new, status: :unprocessable_entity
    end
  end
end
