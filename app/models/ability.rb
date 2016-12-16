class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.role.admin?
      can :manage, [Post, Category, Comment, Platform, Devise]

    elsif user.role.guest?
      can :create, Post, user_id: user.id
      can :destroy, Post, user_id: user.id
      can :read, :all
      can :update, Post, user_id: user.id
      can :create, Comment, user_id: user.id
      can :read, [Post, Comment]
    else
      can :read, :all
    end

  end
end

