Feature: Manage Contacts
  In order to make a phone book
  As an user
  I want to create and manage contacts

  Scenario: List Contacts
    Given I have contacts named Alice and Bob
    When I go to the list of contacts
    Then I should see "Alice"
    And I should see "Bob"

  Scenario: Create Contact
    Given I have no contacts
    And I am on the list of contacts
    When I follow "New Contact"
    And I fill in "Fist name" with "Alice"
    And I fill in "Last name" with "Smith"
    And I fill in "E-mail address" with "alice.smith@example.com"
    And I fill in "Phone number" with "+5621234567"
    And I press "Create"
    Then I should see "New contact created."
    And I should see "Alice"
    And I should see "Smith"
    And I should see "alice.smith@example.com"
    And I should see "+56 2 123 4567"
    And I should have 1 contact

  Scenario: View Contact
    Given I have one contact named Alice
    And Alice last name is Smith
    And Alice email address is alice.smith@example.com
    And Alice phone number is "+5621234567"
    And I am on the list of contacts
    When I follow "View Contact"
    Then I should see "Alice"
    And I should see "Smith"
    And I should see "alice.smith@example.com"
    And I should see "+56 2 123 4567"

  Scenario: Edit Contact
    Given I have one contact named Bob
    And Bob last name is Hamilton
    And I am on the list of contacts
    When I follow "Edit Contact"
    And I fill in "Last Name" with "Poe"
    Then I should see "Contact updated."
    And I should see "Poe"
    And I should not see "Hamilton"

  Scenario: Delete Contact
    Given I have one contact named Charles
    And I am on the list of contacts
    When I follow "Delete Contact"
    Then I should not see "Charles"