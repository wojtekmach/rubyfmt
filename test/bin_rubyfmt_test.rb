require 'minitest/autorun'

describe "./bin/rubyfmt" do
  it do
    expected_path = 'test/fixtures/person.expected.rb'
    actual_path   = 'test/fixtures/person.actual.rb'

    assert_equal File.read(expected_path), `./bin/rubyfmt #{actual_path}`
  end
end
