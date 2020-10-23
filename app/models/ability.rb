# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, _params)
    can %i[read search], User

    can :manage, User, id: user.id if user.present?
  end
end
