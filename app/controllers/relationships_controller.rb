class RelationshipsController < ApplicationController
	#follow a user
	def create
		twitter_user = User.find(params[:followed_id])
		if current_user.present?
			if current_user.following?(twitter_user)
				render json: { :status => "failure", :message => "Already following."}
			else
				user_relationship = current_user.follow(twitter_user)
				render json: { :status => "success", :code => 200, :message => "User followed successfully.", data: user_relationship }
			end
		else
			render json: { :status => "failure", :message => "No user present."}
		end
	end

	#unfollow a user
	def destroy
		twitter_user = Relationship.find(params[:id]).followed
		if current_user.present?
			user_relationship = current_user.unfollow(twitter_user)
			render json: { :status => "success", :code => 200, :message => "You have unfollowed this user successfully.", data: user_relationship }
		else
			render json: { :status => "failure", :message => "No user present."}
		end
	end
end
