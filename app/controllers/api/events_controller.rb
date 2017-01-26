module Api
  class EventsController < ApplicationController
    respond_to :json

    def index
      number = request.query_parameters.first[1].to_i
      respond_with Event.where(date_time: Date.current..(Date.current + number.days))
    end

    def feed
      @events = Event.where(user_id: current_user.id)
      @events.each do |event|
        event.comments.each do |comment|
          comment.where(event.last)
        end
        event.file_attachments.each do |file|
        end
      end
    end
  end
end