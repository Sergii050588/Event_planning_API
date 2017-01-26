module Api
  class EventsController < ApplicationController
    respond_to :xml, :json

    def events_interval
      number = request.query_parameters.first[1].to_i
      respond_with Event.where(date_time: Date.current..(Date.current + number.days))
    end

    def feed
      feed = []
      Event.where(user_id: current_user.id).each do |event|
        event.comments.each do |comment|
          if (Date.current - comment.created_at.to_date).to_i < (Date.current - current_user.updated_at.to_date).to_i
            feed << event.name << comment
          end
        end
        event.file_attachments.each do |file|
          if (Date.current - file.created_at.to_date).to_i < (Date.current - current_user.updated_at.to_date).to_i
            feed << event.name << file
          end
        end
      end
      respond_with feed
    end
  end
end

