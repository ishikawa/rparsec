def import *names
  names.each {|lib|require "#{File.dirname(__FILE__)}/../../rparsec/#{lib}"}
end
