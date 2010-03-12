class Branch < ActiveRecord::Base
  # note: there can be a race condition with validates_uniqueness_of.  need a
  # index or db constraint to insure uniqueness
  validates_uniqueness_of :minor, :scope => :major
  has_many :widgets
  has_and_belongs_to_many :clients

  # gives us a string version of the major and minor numbers
  def version
    "#{major}.#{minor}"
  end

  # a branch is always associated with the most recent widget where the most
  # recent widget is determined by the version number
  def widget
    widgets.first(:order => 'version DESC')
  end
end
