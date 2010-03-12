require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  test "should return the most recent widget for the branch" do
    widget1 = Widget.create(:version => '1.1.0', :notes => 'testing')
    widget2 = Widget.create(:version => '1.1.1', :notes => 'testing')

    assert_equal widget2, Branch.first.widget
  end
end
