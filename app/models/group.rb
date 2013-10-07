class Group < ActiveRecord::Base
	has_many :members
	# has_many :users, through: :member
end
