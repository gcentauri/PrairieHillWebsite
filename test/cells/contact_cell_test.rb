require 'test_helper'

class ContactCellTest < Cell::TestCase
  test "new" do
    invoke :new
    assert_select "p"
  end
  

end
