require 'test_helper'

class DayTimeConceptTest < Cell::TestCase
  test "show" do
    html = concept("day_time/cell").(:show)
    assert html.match /<p>/
  end


end
