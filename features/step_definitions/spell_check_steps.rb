Given /^I have supplied the content \'(.*)\'$/ do |content|
  @params ||= {}
  @params["params"] ||= ["en"]
  @params["method"] = "checkWords"
  @params["params"] << content.split(" ") 
end


When /^I do a spellcheck$/ do
  post '/spell_checker', @params.to_json
end

Then /^I should get a response$/ do
  last_response.should be_ok
end

Then /^there should be (\d*) errors?$/ do |error_count|
  json_hash = JSON.parse(last_response.body) 
  error_count.to_i.should eql(json_hash["result"].size)
end
