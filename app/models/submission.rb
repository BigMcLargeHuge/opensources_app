class Submission < ActiveRecord::Base
	has_one :tag
	accepts_nested_attributes_for :tag
	has_and_belongs_to_many :users

	attr_accessor :fresh

	before_save do
		the_domain = self.domain
		the_domain = the_domain.remove("https://")
		the_domain = the_domain.remove("http://")
		the_domain = the_domain.remove("www.")
		the_domain = the_domain.remove(" ")
		self.domain = the_domain
	end
end
