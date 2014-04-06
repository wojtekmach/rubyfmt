require 'minitest/autorun'
require 'rubyfmt'

describe "Rubyfmt" do
  it do
    assert_fixture 'person'
  end

  it "adds blank line between class definitions" do
    assert_code %Q{
      class Foo
      end

      class Bar
      end
    }, %Q{
      class Foo; end
      class Bar; end
    }
  end

  private

  def code(str)
    str.gsub(/^\ {6}/, '').strip
  end

  def assert_code(expected, actual)
    assert_equal code(expected), Rubyfmt.format(code(actual))
  end

  def assert_fixture(name)
    expected = File.read("./test/fixtures/#{name}.expected.rb").strip
    actual   = File.read("./test/fixtures/#{name}.actual.rb").strip
    assert_code expected, actual
  end
end
