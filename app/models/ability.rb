# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, _params)
    can %i[read search], User
    can :read, Postage
    if user.present?
      can :manage, User, id: user.id
      can :manage, Postage, user_id: user.id
    end
  end
end
