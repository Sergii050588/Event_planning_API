module Api
  class EventsController < ApplicationController
    respond_to :json

    def index
      number = request.query_parameters.first[1].to_i
      respond_with Event.where(date_time: Date.current..(Date.current + number.days))
    end
  end
end