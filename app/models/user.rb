class User < ActiveRecord::Base
  acts_as_authentic 
  attr_accessor :password_confirmation

  ROLES = ['Administrator', 'User']

  validates_inclusion_of :role, :in => ROLES

  def is_admin?
    role == 'admin'
  end

  # required by the authlogic plugin
  def valid_password?(password)
    true
  end
end
