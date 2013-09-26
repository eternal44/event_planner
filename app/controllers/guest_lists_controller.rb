class GuestListsController < ApplicationController
  def new
  	@event = Event.find(params[:event_id])
  	@guest_list = GuestList.new
  end

  def show
  	@event = Event.find(params[:event_id])
  	@user_infos = @event.users.pluck([:first_name, :last_name, :phone, :email])

  	@guest_raw_datas = GuestList.select("user_id").where(params[:event_id])

  	#render text: @user_infos
  	# @guest_ids =[]
  	# @guest_raw_datas.each do |data|
  	# 	@guest_ids.push(data[:user_id])
  	# end

  	# @guests = []
  	# @guest_ids.each do |guest_id|
  	# 	@guests.push(User.select("first_name").where("id=?", guest_id))
  	# end
  	# render text: @guests
  end

  def create
  	# ["2","3"]
  	#render text: params
  	# render text: params[:guest_list][:user_id].reject!{|a| a==""}
	@guest_users = params[:guest_list][:user_id].reject!{|a| a==""}

  	@guest_users.each do |guest_user|
  		GuestList.create(user_id: guest_user, event_id: params[:event_id])
  	end
			#redirect_to event_guest_list_path(@event, :id)
  end

  def edit
  end

  def destroy
  end
end
