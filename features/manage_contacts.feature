Feature: Manage Contacts
  In order to make a phone book
  As an user
  I want to create and manage contacts

  Scenario: List Contacts
    Given Alice is a contact
    And Bob is a contact
    When I go to the list of contacts
    Then I should see "Alice"
    And I should see "Bob"

  Scenario: Create Contact
    Given no contacts exist
    And I go to the list of contacts
    When I add a contact
    Then I should see the page for my newly created contact
    And I should see "Contact was successfully created."

  Scenario: View Contact
    Given Alice is a contact
    When I go to the list of contacts
    And I follow "Show"
    Then I should see the Alice's contact page

  Scenario: Edit Contact
    Given Bob is a contact
    When I edit Bob's phone number with "+56987543210"
    Then I should see "+56987543210"
    And I should see "Contact was successfully updated."

  Scenario: Delete Contact
    Given Charles is a contact
    When I go to the list of contacts
    And I follow "Destroy"
    Then I should not see "Charles"