module EventsHelper
  def following_event?(event_id)
    unless @following_event
      @following_event = []
      current_user.events.map { |event| @following_event << event.id }
    end
    @following_event.include?(event_id)
  end
end
