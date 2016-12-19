class Submission < ActiveRecord::Base
	has_one :tag
	accepts_nested_attributes_for :tag
	has_and_belongs_to_many :users
end
