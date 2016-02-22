class UserPolicy
  attr_reader :current_user, :model, :user
  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    current_user.try(:admin?)
  end

  def show?
    current_user.try(:admin?) || current_user == user
  end

  def update?
    current_user.try(:admin?)
  end

  def destroy?
    return false if current_user == user
    current_user.try(:admin?)
  end
end
