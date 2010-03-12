require 'test_helper'

class WidgetTest < ActiveSupport::TestCase
  test "should reject a widget without major, minor and maintenance numbers" do
    assert_raise(ActiveRecord::RecordInvalid) { Widget.create!(:version => '1.1') }
  end

  test "should reject a widget with a non-numeric character in the version number" do
    assert_raise(ActiveRecord::RecordInvalid) { Widget.create!(:version => '1.1q') } 
  end

  test "should accpet a widget with leading or traililng spaces in the version number" do
    assert Widget.create!(:version => ' 1.1.1 ') 
  end

  test "should create a branch for widget if the appropriate one does not exist" do
    # verify pre-condition
    assert_equal [], Branch.all

    widget = Widget.create(:version => '1.1.0', :notes => 'testing')

    # verify that a branch has been created
    branch = Branch.first
    assert branch

    # verify that the branch is associated with the new widget 
    assert_equal branch, widget.branch

    # verify that the branch has the appropriate major and minor version
    # numbers based on the widget major and minor version numbers
    assert_equal 1, branch.major
    assert_equal 1, branch.minor
  end
 
  test "should associate existing branch with a widget on widget creation" do
    branch = Branch.create!(:major => 1, :minor => 1)
    Branch.create!(:major => 1, :minor => 2) # another branch to insure that the correct one is associated with the widget

    widget = Widget.create(:version => '1.1.0', :notes => 'testing')

    assert_equal branch, widget.branch
  end
  
  test "should remove a branch if no widgets are associated with the branch" do
    # verify pre-condition
    assert_equal [], Branch.all

    widget = Widget.create(:version => '1.1.0', :notes => 'testing')

    widget.destroy

    assert_equal [], Branch.all
  end
end
