require 'spec_helper'

describe "contacts/show" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email_address => "Email Address",
      :phone_number => "Phone Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email Address/)
    rendered.should match(/Phone Number/)
  end
end
