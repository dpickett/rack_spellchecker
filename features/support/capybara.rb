# require 'capybara'
# require 'capybara/cucumber'
# Capybara.app = RackSpellChecker::Application
require "rack/test"
module AppSpecification
  def app
    RackSpellChecker::Application.new
  end
end

World(Rack::Test::Methods)
World(AppSpecification)