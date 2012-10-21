Given /^no contacts exist$/ do
  # nop
end

Given /^(.+) is a contact$/ do |first_name|
  Contact.create!(first_name: first_name)
end

Given /^I have contacts named (.+)$/ do |first_names|
  first_names.split(", ").each do |first_name|
      Contact.create!(first_name: first_name)
  end
end

When /^I go to the list of contacts$/ do
  visit contacts_path
end

When /^I add a contact$/ do
  click_link "New Contact"
  fill_in "contact_first_name", with: "Alice"
  fill_in "contact_last_name", with: "Smith"
  fill_in "contact_email_address", with: "alice.smith@example.com"
  fill_in "contact_phone_number", with: "+5621234567"
  click_button "Create Contact"
end

When /^I follow "(.*?)"$/ do |link|
  click_link link
end

Then /^I should see "(.+)"$/ do |first_names|
  first_names.split(", ").each do |first_name|
    page.should have_content first_name
  end
end

Then /^I should see the page for my newly created contact$/ do
  current_path.should == contact_path(Contact.last.id)
end

Then /^I should see the (.+)'s contact page$/ do |first_name|
  visit contact_path(Contact.find_by_first_name(first_name))
end