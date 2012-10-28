Given /^I have a contact with a custom picture$/ do
  step "I have a contact"
  pending
  #@contact.picture = FactoryGirl.create(:picture, src: "/assets/custom.png")
end

Given /^the contact has a gravatar$/ do
  pending
end

When /^I change the contact picture$/ do
  click_link "Change Picture"
  fill_in "image", with: "/assets/new.png"
  click_button "Upload Picture"
end

When /^I go to the edit contact picture page$/ do
  visit edit_contact_picture_path
end

When /^I remove the picture$/ do
  pending
end

Then /^I should see the default picture$/ do
  page.should have_selector('img[src="/assets/rails.png"]')
end

Then /^I should see the new picture$/ do
  page.should have_selector('img[src="/assets/new.png"]')
end

Then /^I should not see a link to remove the picture$/ do
  page.should_not have_link('Re[href=#{contact_picture_path},method="destroy"]')
end

Then /^I should see the contact gravatar$/ do
  pending
end