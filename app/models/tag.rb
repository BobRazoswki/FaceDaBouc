class Tag < ActiveRecord::Base
	has_and_belongs_to_many :articles

	def to_param
		text.delete('#')
	end


end
