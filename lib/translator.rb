require 'yaml'

def load_library(path)
  emoticon_library = YAML.load_file(path)
  # emoticon_hash = { :meaning => {} } -- first attempt
  emoticon_hash = Hash.new

  emoticon_library.each do |feeling, translation|
    # what do you want it to do every loop? create this:
    # {
    #     'happy' => {
    #        :english => ":)",
    #        :japanese => "(＾ｖ＾)"
    #     }
    #  }

    # emoticon_hash[:meaning] = feeling -- first attempt
    # returns {:meaning=>"wink"} -- not what we want

    emoticon_hash[feeling] = {
      :english => translation[0],
      :japanese => translation[1]
    }
    # instead of just assigning it to meaning as a value, it creates a new hash with both translations for every emoticon in the library
  end
  emoticon_hash
end

# https://stackoverflow.com/questions/5215713/ruby-what-is-the-easiest-method-to-update-hash-values
# for this example
# new_hash = {}
# old_hash.each do |key, value|
#   new_hash[key] = foo(value)
# end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  library.each do |emote, language|
    # can access inside library using symbols
    if emoticon == language[:english]
      return language[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  library.each do |emote, language|
    if emoticon == language[:japanese]
      return emote
    end
  end
  return "Sorry, that emoticon was not found"
end
