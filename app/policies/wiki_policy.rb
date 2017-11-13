class WikiPolicy < ApplicationPolicy

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

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.premium?
        scope.all
      else
        scope.where(private: false)
      end
    end
  end
end
