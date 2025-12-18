class EventInvitationsController < ApplicationController
  def new
  end

  def create
    event = current_user.events.find(params[:event_id])
    invite_user = User.where(name: params[:name])
    event.invited_users << invite_user
    if event.save && !invite_user.empty?
      redirect_to event_path(event)
    else
      flash.now[:alert] = "Invalid Username"
      render :new, status: :unprocessable_entity
    end
  end
end
