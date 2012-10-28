class Contact < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :phone_number

  has_one :picture
end
