class User < ActiveRecord::Base
  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "- Passwords must match",
    if: :password

  def set_default_role
    self.role ||= :user
  end
end
