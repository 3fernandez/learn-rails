require 'spec_helper'

describe "Contact" do
	before :each do
		@contact = Contact.create(name: 'Jorge Safado', 
			email: 'jorge@ipremios.com', content: 'bla bla.')
	end

	context "validates Contacts fields" do
		it "Valid fields" do
			expect(@contact).to be_valid
		end
	end
end