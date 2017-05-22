class CoursesLoyalty < ApplicationLoyalty

  def edit?
    user.admin?
  end
  def index?
    user.admin?
  end
  def destroy?
    user.admin?
  end
  def update?
    user.admin?
  end


end
