require 'test_helper'

class DaytimeConceptTest < Cell::TestCase
  test "show" do
    html = concept("daytime/cell").(:show)
    assert html.match /<p>/
  end


end
