require 'spec_helper'

describe "contacts/new" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :first_name => "MyString",
      :last_name => "MyString",
      :email_address => "MyString",
      :phone_number => "MyString"
    ).as_new_record)
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacts_path, :method => "post" do
      assert_select "input#contact_first_name", :name => "contact[first_name]"
      assert_select "input#contact_last_name", :name => "contact[last_name]"
      assert_select "input#contact_email_address", :name => "contact[email_address]"
      assert_select "input#contact_phone_number", :name => "contact[phone_number]"
    end
  end
end
