class PostsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@posts=@user.posts.all 
			render json: {:posts => @posts, response: 200, responsemsg: "success"}
	end
  def create
		event = Event.find(params[:event_id])
		 if event.blank?
			return render json: {response: 500,msg: "user not found"}
		end

		user_events = event.posts.build(post_params) 
		if user_events.save
			render json: {response: 500,msg: "Event Created", feeds: user_events}
		else
			render json: {response: 500,msg: "Event Not Created"}
		end
	end
  private 

def post_params
			params.require(:posts).permit(:name,:content,:user_id)

end
end
