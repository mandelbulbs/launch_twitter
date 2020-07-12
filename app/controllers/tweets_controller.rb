class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
		

	end


	def create
		#@tweet = Tweet.new #params["tweet"]
		#@tweet.content = params["tweet"]["content"]
		#@tweet.save

		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			flash[:success] = "Your tweet was succesfully published!"
			redirect_to new_tweet_path
		else
			#once we're in here, there is a .errors
			render 'new'
		end
	end

	def tweet_params
		params.require(:tweet).permit(:content)
	end

end
