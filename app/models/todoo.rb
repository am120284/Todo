class Todoo < ActiveRecord::Base
	belongs_to :user
	#attr_accessible :name, :completed
end
