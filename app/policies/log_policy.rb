class LogPolicy
  attr_reader :current_user, :model, :log
  def initialize(current_user, model)
    @current_user = current_user
    @log = model
  end

  def index?
    current_user.try(:admin?)
  end

  def show?
    current_user.try(:admin?)
  end

  def new?
    create?
  end

  def create?
    current_user.try(:admin?) || current_user.try(:user?)
  end

  def edit?
    update?
  end

  def update?
    current_user.try(:admin?)
  end

  def destroy?
    current_user.try(:admin?)
  end
end
