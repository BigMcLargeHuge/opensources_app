class Website < ActiveRecord::Base
	has_one :tag
	has_many :issues
end
