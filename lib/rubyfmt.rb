require 'rubyfmt/version'
require 'ruby2ruby'
require 'ruby_parser'

module Rubyfmt
  def self.format(string)
    Processor.new.process(RubyParser.new.parse(string)).strip
  end

  class Processor < Ruby2Ruby
    def process_class(exp)
      super + "\n"
    end

    def process_if(exp)
      super.sub(/\ then$/, '')
    end

    def process_while(exp)
      super.sub(/\ do$/, '')
    end

    def process_call(exp)
      methods_without_parens = [
        :require, :load,
        :puts,
        :attr_reader, :attr_writer, :attr_accessor,
        :public, :private, :protected,
      ]

      method = exp[1]
      
      if methods_without_parens.include?(method)
        super.sub(/^(#{method})\((.*)\)$/, '\1 \2')
      else
        super
      end
    end

    def indent(s)
      super.split(/\n/).map {|line| line.strip.size == 0 ? '' : line }.join("\n")
    end
  end
end
