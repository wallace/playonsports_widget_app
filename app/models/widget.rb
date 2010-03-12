class Widget < ActiveRecord::Base
  belongs_to :branch

  validates_format_of :version, :with => /\A[0-9]+\.[0-9]+\.[0-9]?\Z/, :message => "is invalid.  Here is an example of the correct version format: 1.1.3."
  validates_uniqueness_of :version # note: there can be a race condition with this validation.  need a index or db constraint to insure uniqueness

  before_validation :trim_version
  before_create :set_branch
  after_destroy :remove_branches_with_no_widgets

  # deletes leading and trailing whitespace
  def trim_version
    version.strip!
  end

  # Insure that the widget is associated with the correct branch
  def set_branch
    # determine which branch should be used for major and minor version numbers
    major, minor, maintenance = version.split(".")

    # if branch, doesn't exist create it and associate it
    branch = Branch.first(:conditions => { :major => major, :minor => minor})

    if branch.blank?
      branch = Branch.create!({:major => major, :minor => minor})
    end

    self.branch = branch
  end

  # if this widget is the last of its branch, we remove the empty branch
  def remove_branches_with_no_widgets
    widgets = Widget.all(:conditions => {:branch_id => self.branch_id})

    self.branch.destroy if widgets.blank?
  end
end
