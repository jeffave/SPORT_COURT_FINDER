class CourtPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    # Todo mundo pode fazer esta ação
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    ## Se o usuario  for mesmo, ele pode editar
    if user == record.user
      true
    else
      false
    end
  end

  def update?
    if user == record.user
      true
    else
      false
    end
  end

  def destroy?
    user == record.user
  end
end
