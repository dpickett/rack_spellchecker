Feature: Mispelled Replacement Suggestion
  As a TinyMCE text editor
  I want to get replacement suggestions
  So that I can ensure my posts are spelled correctly

  Scenario: I request replacement suggestions for a mispelled word
    Given I have entered the word 'shesells'
    When I request possible replacements
    Then I should get a response
    And I should get an array of results
    And I should see 'seashells' as a replacement option
    And I should get a position identifier so I can perform a valid replacement

  Scenario: I request replacement suggestions for a properly spelled word
    Given I have entered the word 'seashells'
    When I request possible replacements
    Then I should get a response
    And I should get an array of results

