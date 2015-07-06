class Todoo < ActiveRecord::Base
	belongs_to :user
	default_scope { order('updated_at DESC') }
	#attr_accessible :name, :completed
end
