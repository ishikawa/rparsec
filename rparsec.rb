%w{
parsers operators keywords expressions
}.each {|lib| require_relative "rparsec/#{lib}"}
