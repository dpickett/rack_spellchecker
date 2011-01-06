Given /^I have entered the word '(.*)'$/ do |word|
  @params = {}
  @params["params"] = ["en"]
  @params["params"] << word
  @params["id"] = "c0"
end

When /^I request possible replacements$/ do
  @params["method"] = "getSuggestions"
  post "/spell_checker", @params.to_json
  @json_hash = JSON.parse(last_response.body)
  @result = @json_hash["result"]
end

Then /^I should get an array of results$/ do
  @result.should be_kind_of(Array)
end

Then /^I should see '(.*)' as a replacement option$/ do |word|
  @result.should include(word)
end

Then /^I should get a position identifier so I can perform a valid replacement$/ do
  @json_hash["id"].should eql(@params["id"])
end

