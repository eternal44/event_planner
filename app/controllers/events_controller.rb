class EventsController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		#@users = User.all
	end

	def create
		@user = User.find(params[:user_id])
		@event = @user.events.create(params[:event])

		if @event.save
			redirect_to user_path(@user)
		else
			#render text: @event.errors.full_messages
			render 'new'
		end
	end

	def index
		@user = User.find(params[:user_id])
		@events = @user.events.all
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		redirect_to :back

	end

end
