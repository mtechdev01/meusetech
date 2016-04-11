require 'test_helper'

class Blogs::SidebarCellTest < Cell::TestCase
  test "show" do
    html = cell("sidebar").(:show)
    assert html.match /<p>/
  end


end
