require 'spec_helper'

describe "Contacts" do

  let!(:contact) { FactoryGirl.create(:contact) }

  describe "list page" do

    it "should works" do
      get contacts_path
      response.status.should be(200)
    end
  end
  describe "show page" do
    before { visit contact_path(contact) }

    it "should display the default contact picture" do
      page.should have_selector('img[src="/assets/rails.png"]')
    end

    it "should have a 'Change Picture' link" do
      page.should have_link('Change Picture', {href: edit_contact_picture_path(contact)})
    end
  end
end
