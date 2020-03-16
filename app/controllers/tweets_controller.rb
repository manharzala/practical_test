class TweetsController < ApplicationController

	#create a tweet
	def create
		if current_user.present?
			tweet = current_user.tweets.create(tweet_params)
			render json: { :status => "success", :code => 200, :message => "Your tweet created successfully.", data: tweet }
		end
	end

	#list of tweets you follow the user
	def index
		user = User.find_by(id: params[:user_id])
		if user.present?
			follower_ids = user.followers.pluck(:id)
			tweets = Tweet.where("user_id IN (?)", follower_ids).order("updated_at DESC")
			render json: { :status => "success", :code => 200, :message => "List of the tweets to whom you follow.", data: tweets }			
		else
			render json: { :status => "failure", :message => "No user present." }
		end
	end


	private
	def tweet_params
		params.require(:tweet).permit(:tweet_content, :user_id)
	end
end
