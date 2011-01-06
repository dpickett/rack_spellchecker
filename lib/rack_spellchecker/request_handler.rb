module RackSpellChecker
  #Handles incoming requests from the rack application
  #TinyMCE issues two types of requests: checking for errors and suggesting replacements
  class RequestHandler
    #dispatches the request to a spelling check or alternative suggestion
    #if TinyMCE supplied the method "getSuggestions" it will perform the spelling check
    def self.process(req)
      if req["method"] == "getSuggestions"
        suggest_alternatives_for(req["params"][1], req["id"])
      else
        check(req["params"][1])
      end
    end

    #checks the content for mispelled words
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

    #suggests alternatives for a mispelled word
    def self.suggest_alternatives_for(word, position_id)
      {
        "id"     => position_id,
        "error"  => nil,
        "result" => spelling_utility.suggest(word)[0..8]
      }
    end
    
    def self.spelling_utility #nodoc
      Aspell.new("en")
    end
  end
end
