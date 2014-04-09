require 'minitest/autorun'
require 'rubyfmt'

describe "Rubyfmt" do
  it "works" do
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

  it "adds blank line between method definitions" do
    assert_code %Q{
      class Foo
        def foo
          42
        end

        def bar
          42
        end
      end
    }, %Q{
      class Foo
        def foo; 42 end
        def bar; 42 end
      end
    }
  end

  it "does not add parens for puts" do
    assert_code 'puts 42', 'puts 42'
  end

  it "does not add parens for ||" do
    skip
    assert_code 'a || b', 'a || b'
  end

  it 'handles __FILE__' do
    skip
    assert_code '__FILE__', '__FILE__'
  end

  it "uses 1.9 hashes" do
    skip
    assert_code '{a: 42}', '{a: 42}'
  end

  it "does not add parens for <<" do
    skip
    assert_code 'a << 42', 'a << 42'
  end

  it "does not add parens for +"do
    skip
    assert_code '1 + 2', '1 + 2'
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
