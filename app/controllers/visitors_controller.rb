class VisitorsController < ApplicationController
	def new
		@owner = Owner.new
		flash.now[:notice] = "Welcome"
		flash.now[:alert] = "My birthday is soon"
		#Rails.logger.debug 'DEBUG: Owner name is ' + @owner.name
	end
end