class Client < ActiveRecord::Base
  has_many :contacts, :dependent => :destroy
  has_and_belongs_to_many :branches

  validates_uniqueness_of :name, :API
  validates_presence_of :name, :API

  default_scope :order => 'name ASC'

  def using?(branch)
    branches.include?(branch)
  end

  # Returns an array of strings, one for each branch with which this client is associated.
  def sample_code
    branches.map do |branch|
      "<script src='http://static.playonsports.com/core_player/#{branch.version}/core_player.nocache.js?token=#{self.API}'></script>"
    end
  end
end
