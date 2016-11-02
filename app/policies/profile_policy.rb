class ProfilePolicy < ApplicationPolicy
  def edit?
    record.user == user
  end
  alias :update? :edit?
end
