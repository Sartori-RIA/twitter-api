# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, _params)
    can %i[read search], User
    can :read, Postage

    return if user.blank?

    can :manage, User, id: user.id
    can :manage, Postage, user_id: user.id
    can :manage, Follow do |follow|
      follow.user_id == user.id || follow.follow_id == user.id
    end
  end
end
