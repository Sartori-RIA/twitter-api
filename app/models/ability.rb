# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, controller_name, params)
    can %i[read search], User

    can %i[read search], Follow, user_id: params[:user_id] if controller_name == 'Api::Users::Follows'
    can %i[read search], Follow, follow_id: params[:user_id] if controller_name == 'Api::Users::Followers'
    can :read, Postage

    return if user.blank?

    can :manage, User, id: user.id
    can :manage, Postage, user_id: user.id
    can :manage, Follow do |follow|
      follow.user_id == user.id || follow.follow_id == user.id
    end
  end
end
