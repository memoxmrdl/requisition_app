class RequisitionPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    record.user == user
  end
  alias :create? :new?
  alias :edit? :new?
  alias :update? :new?

  def destroy?
    false
  end
end
