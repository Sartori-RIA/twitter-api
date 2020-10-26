# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, controller_name, params)
    can %i[read search user_name_available? email_available?], User

    can %i[read search count check], Follow, user_id: params[:user_id] if controller_name == 'Api::Users::Follows'
    can %i[read search count], Follow, follow_id: params[:user_id] if controller_name == 'Api::Users::Followers'
    if controller_name == 'Api::Users::Postages'
      can %i[read search count], Postage, user_id: params[:user_id]
    else
      can %i[read], Postage
    end

    return if user.blank?

    can :manage, User, id: user.id
    can :manage, Postage, user_id: user.id
    can :manage, Follow do |follow|
      follow.user_id == user.id || follow.follow_id == user.id
    end
  end
end
