require "test_helper"

class HashnamerRubyTest < Minitest::Test
  def has_a_version_number
    refute_nil ::HashnamerRuby::VERSION
  end
end
