class Submission < ActiveRecord::Base
	has_one :tag
	accepts_nested_attributes_for :tag
end
