require 'minitest/autorun'
require 'rubyfmt'

describe "Rubyfmt" do
  it do
    assert_code %q{
      class Person
        def initialize(name, title = nil)
          @name = name
          @title = title
        end
        
        def to_s
          return "#{title} #{name}" if title
          name
        end
      end
    }, %q{
      class Person

        def initialize(name, title=nil)
          @name=name
          @title=title
        end

        def to_s
          return "#{title} #{name}" if title
          name
        end

      end
    }
  end

  def code(str)
    str.gsub(/^\ {6}/, '').strip
  end

  def assert_code(expected, actual)
    assert_equal code(expected), Rubyfmt.format(code(actual))
  end
end
