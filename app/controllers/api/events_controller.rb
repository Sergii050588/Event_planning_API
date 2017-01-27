module Api
  class EventsController < ApplicationController
    respond_to :xml, :json

    # Returns all events from now till number of days from URL
    def index
      number = request.query_parameters.first[1].to_i
      respond_with Event.where(date_time: Date.current..(Date.current + number.days))
    end

    # Feed API returns latest(from his last_sign_in date) comments and files of current_user events
    def feed
      if current_user
        feed = []
        Event.where(user_id: current_user.id).each do |event|
          event.comments.each do |comment|
            if (DateTime.current - comment.created_at.to_datetime).to_f < (DateTime.current - current_user.last_sign_in.to_datetime).to_f
              feed << event.name << comment
            end
          end
          event.file_attachments.each do |file|
            if (DateTime.current - file.created_at.to_datetime).to_f < (DateTime.current - current_user.last_sign_in.to_datetime).to_f
              feed << event.name << file
            end
          end
        end
        respond_with feed
      else
        redirect_to root_path
      end
    end
  end
end
