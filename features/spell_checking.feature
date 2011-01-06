Feature: Spell Checking
  As a tinyMCE text editor
  I want to check my text
  So that my post will be spelled correctly

  Scenario: I perform spell checking with a mispelled word
    Given I have supplied the content 'Sally sells shesells down by the seashore'
    When I do a spellcheck
    Then I should get a response
    And there should be 1 error

  Scenario: I perform spell checking with perfect spelling
    Given I have supplied the content 'Sally sells seashells down by the seashore'
    When I do a spellcheck
    Then I should get a response
    And there should be 0 errors

