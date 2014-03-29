require 'rubyfmt/version'
require 'ruby2ruby'
require 'ruby_parser'

module Rubyfmt
  def self.format(string)
    Processor.new.process(RubyParser.new.parse(string))
  end

  class Processor < Ruby2Ruby
    def process_if(exp)
      super.sub(/\ then$/, '')
    end

    def process_while(exp)
      super.sub(/\ do$/, '')
    end
  end
end
