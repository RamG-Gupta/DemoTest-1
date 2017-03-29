class EventsController < ApplicationController
    def index
		@user = User.find(params[:user_id])
		@events=@user.events.all 
			render json: {:event => @events, response: 200, responsemsg: "success"}
	end
	def create
		user = User.find_by(params[:user_id])
		 if user.blank?
			return render json: {response: 500,msg: "user not found"}
		end

		user_events =Event.create(event_params) 
		if user_events.save
			render json: {response: 500,msg: "Event Created", events: user_events}
		else
			render json: {response: 500,msg: "Event Not Created"}
		end
	end

	
	def update
        user = User.find_by(params[:user_id])

        if user.events.update(event_params)
               render json: {:event => "response code: 200, response message: Successfull"}
             
        else
                 render json: {:event => "response code: 400, response message: Bad Request"}
          end
    end      
         
    def destroy
        user = User.find_by(params[:user_id])
        
            if user.events.destroy
               render json: {responsecode: 200, responsemessage: "Success"}
        else
              render json: {responsecode: 400, responsemessage: "Bad Request"}
          end
    end
         
 
    
	private 

def event_params
			params.require(:event).permit(:event_name,:location, :user_id)

end

end

