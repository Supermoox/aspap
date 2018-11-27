class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]



  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :body)
    end
end
