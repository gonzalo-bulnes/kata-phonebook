class Picture < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :contact
end
