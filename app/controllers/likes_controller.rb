class LikesController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@likes=@user.likes.all 
			render json: {:likes => @likes, response: 200, responsemsg: "success"}
	end
	def create
		user = User.find(params[:user_id])
		 if user.blank?
			return render json: {response: 500,msg: "user not found"}
		end

		user_events =user.likes.build(like_params) 
		if user_events.save
			render json: {response: 500,msg: "Event Created", likes: user_events}
		else
			render json: {response: 500,msg: "Event Not Created"}
		end
	end
	private 

    def like_params
			params.require(:likes).permit(:status, :user_id)

    end

end
