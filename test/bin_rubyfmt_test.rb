require 'minitest/autorun'

describe "./bin/rubyfmt" do
  it do
    assert_equal "foo(42)\n", `echo 'foo( 42 )' | ./bin/rubyfmt`
  end
end
