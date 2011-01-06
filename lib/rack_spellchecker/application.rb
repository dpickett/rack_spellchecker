require "json"

module RackSpellChecker
  class Application
    def call(env)
      req = JSON.parse(env["rack.input"].read)
      results = RackSpellChecker::RequestHandler.process(req) 
      [200, {"Content-Type" => "text/javascript"}, [results.to_json]]
    end
  end
end