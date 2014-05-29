class Contact < ActiveRecord::Base
	has_no_table

	column :name, :string
	column :email, :string
	column :content, :string

	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :content
	validates_format_of :email,
		:with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
	validates_length_of :content, :maximum => 500
	

	# Data manipulation cames on model "The Rails Way, Skinny Controller and Fat Models
	def update_spreadsheet
		connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"])
		ss = connection.spreadsheet_by_title('Learn-Rails-Example')
		if ss.nil?
			ss = connection.create_spreadsheet('Learn-Rails-Example')
		end
		ws = ss.worksheets[0]
		Rails.logger.debug "ALERT: First ws.num_rows #{ws.num_rows}"
		last_row = 1 + ws.num_rows
		Rails.logger.debug "ALERT: Second last_row #{last_row}"
		ws[last_row, 1] = Time.new
		ws[last_row, 2] = self.name
		ws[last_row, 3] = self.email
		ws[last_row, 4] = self.content
		ws.save
	end

end