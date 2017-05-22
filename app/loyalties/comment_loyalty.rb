class CommentLoyalty < ApplicationLoyalty

  def index?
    user.admin?
  end
  def destroy?
    user.admin?
  end
  def show?
    user.admin?
  end
end
