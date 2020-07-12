class TweetsController < ApplicationController
	
	before_action :authenticate_user!

	def new
		@tweet = Tweet.new
		

	end


	def create #def is an action
		#@tweet = Tweet.new #params["tweet"]
		#@tweet.content = params["tweet"]["content"]
		#@tweet.save

		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		if @tweet.save
			flash[:success] = "Your tweet was succesfully published!"
			redirect_to new_tweet_path
		else
			#once we're in here, there is a .errors
			p @tweet.errors.inspect #for detecting user error (prevents non-users from posting)
			render 'new'
		end
	end

	def tweet_params
		params.require(:tweet).permit(:content)
	end

end
