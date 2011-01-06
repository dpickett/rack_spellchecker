module RackSpellChecker
  class RequestHandler
    def self.process(req)
      if req["method"] == "getSuggestions"
        suggest_alternatives_for(req["params"][1], req["id"])
      else
        check(req["params"][1])
      end
    end

    def self.check(content)
      bad_words = []
      content.each do |word| 
        unless spelling_utility.check(word)
          bad_words << word
        end
      end

      { 
        "id"     => nil,
        "error"  => nil,
        "result" => bad_words.uniq
      }
    end

    def self.suggest_alternatives_for(word, position_id)
      {
        "id"     => position_id,
        "error"  => nil,
        "result" => spelling_utility.suggest(word)[0..8]
      }
    end
    
    def self.spelling_utility
      Aspell.new("en")
    end
  end
end
