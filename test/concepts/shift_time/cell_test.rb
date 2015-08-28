require 'test_helper'

class ShiftTimeConceptTest < Cell::TestCase
  test "show" do
    html = concept("shift_time/cell").(:show)
    assert html.match /<p>/
  end


end
