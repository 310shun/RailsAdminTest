class User < ActiveRecord::Base
	has_many :members
	# has_many :groups, through: :member
end
