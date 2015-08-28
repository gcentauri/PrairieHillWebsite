require 'test_helper'

class SandboxCellTest < Cell::TestCase
  test "show" do
    html = cell("sandbox").(:show)
    assert html.match /<p>/
  end


end
