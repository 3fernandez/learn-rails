class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(secure_params)
		if @contact.valid?
			# Save data
			@contact.update_spreadsheet
			# Send message
			UserMailer.contact_email(@contact).deliver
			# Flash message
			flash[:notice] = "Message sent from #{@contact.name}"
			# Redirect to home
			redirect_to root_path
		else
			render :new
		end
	end

	private
	def secure_params
		params.require(:contact).permit(:name, :email, :content)
	end

	#def process_form
	#	Rails.logger.debug "DEBUG: params are #{params}"
	#	flash[:notice] = "Received request from #{params[:contact][:name]}"
	#	redirect_to root_path
	#end
end