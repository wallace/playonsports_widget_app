class SeedData < ActiveRecord::Migration
  def self.up
    # i don't normally create records in the migration but this will allow others
    # to quickly get started with the app without having to resorting to
    # accessing the console or database directly since the app requires authentication
    User.create!(:login => 'admin', :password => 'test', :role => 'Administrator')

    # since the App says that we have three existing branches we create the widgets here.
    # see the README for more info

    Widget.create(:version => '1.0.0', :notes => 'initial version')
    Widget.create(:version => '1.1.0', :notes => 'initial version')
    Widget.create(:version => '1.2.0', :notes => 'initial version')
  end

  def self.down
  end
end
