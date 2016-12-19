class Website < ActiveRecord::Base
	has_many :tags
	has_many :issues
end
