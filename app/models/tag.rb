class Tag < ActiveRecord::Base
  belongs_to :website
  belongs_to :submission
end
