class EventsController < ApplicationController
   def index
	@user = User.find(params[:user_id])
	@event = @user.events.all

	render json: {:event=> @event}
end


def create
		user = User.find(params[:user_id])
		 if user.blank?
			return render json: {response: 500,msg: "user not found"}
		end

		user_events = user.events.build(event_params) 
		
		if user_events.save!
			render json: {response: 200,msg: "Event Created", event: user_events}
		else
			render json: {response: 500,msg: "Event Not Created"}
		end
end

def update
	user = User.find(params[:user_id])
	@event = user.events.find_by(params[:id])

	if @event.update(event_params)
		render json: {response: 200,msg: "Event updated", events: @event}
		else
			render json: {response: 500,msg: "Event Not updated"}
		end
end


 
    
	private 

def event_params
			params.require(:event).permit(:event_name,:location)

end

end

