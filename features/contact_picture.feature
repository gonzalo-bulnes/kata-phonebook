Feature: Contact Picture
  As an user
  I want contacts to have a picture
  In order to recognize them quickly

  Scenario: Default picture
    Given I have a contact
    When I go to the contact page
    Then I should see the default picture

  Scenario: Add custom picture
    Given I have a contact
    And I am on the contact page
    When I change the contact picture
    Then I should be redirected to the contact page
    And I should see the new picture

  Scenario: Remove custom picture
    Given I have a contact with a custom picture
    When I go to the edit contact picture page
    And I remove the picture
    Then I should be redirected to the contact page
    And I should see the default picture

  Scenario: Change custom picture
    Given I have a contact with a custom picture
    When I change the contact picture
    Then I should be redirected to the contact page
    And I should see the new picture

  Scenario: Remove default picture
    Given I have a contact
    When I go to the edit contact picture page
    Then I should not see a link to remove the picture

  Scenario: Gravatar default picture
    Given I have a contact
    And the contact has a gravatar
    When I go to the contact page
    Then I should see the contact gravatar