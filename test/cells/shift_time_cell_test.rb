require 'test_helper'

class ShiftTimeCellTest < Cell::TestCase
  test "show" do
    html = cell("shift_time").(:show)
    assert html.match /<p>/
  end


end
