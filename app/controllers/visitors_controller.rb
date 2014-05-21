class VisitorsController < ApplicationController
	def new
		@owner = Owner.new
		#flash.now[:notice] = "Welcome"
		#flash.now[:alert] = "My birthday is soon"

		#For dinamic update of date on footer
		@displayDate = Date.today.year
		#Rails.logger.debug 'DEBUG: Owner name is ' + @owner.name
	end
end