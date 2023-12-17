require_relative 'config'

module ParserApp
  Config.config do |program|
    program.condition = -> (item) { item.subjects.length() > 5 }
  end
end