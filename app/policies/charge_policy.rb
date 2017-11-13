class ChargePolicy < ApplicationPolicy

  def index?
    user.admin? || user.wikis.count
  end

  def update?
    user.present?
  end

  def new?
    user.present?
  end

  def destroy?
    user.role == 'admin' || wiki.user == user
  end

  def create?
    user.present?
  end

  def show?
    user.present? && (!wiki.private || user.admin? || wiki.user_id == user.id)
  end

  def edit?
    user.present?
  end
end
