Given /^I have contacts named (.+)$/ do |first_names|
  first_names.split(", ").each do |first_name|
      Contact.create!(first_name: first_name)
  end
end

When /^I go to the list of contacts$/ do
  visit contacts_path
end

Then /^I should see "(.+)"$/ do |first_names|
  first_names.split(", ").each do |first_name|
    page.should have_content first_name
  end
end
