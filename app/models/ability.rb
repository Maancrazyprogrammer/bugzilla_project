# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)


    if user.manager?
      can :read, Project, manager_id: user.id
      can :read, Bug,manager_id: user.id
      can :read, Join, manager_id: user.id
      can :new, Project, manager_id: user.id
      can :create, Project, manager_id: user.id
      can :destroy, Project, manager_id: user.id
      can :update, Project, manager_id: user.id
      can :edit, Project, manager_id: user.id

      can :new, Join, manager_id: user.id
      can :create, Join, manager_id: user.id
      cannot:new, Bug, manager_id: user.id
      cannot :create, Bug, manager_id: user.id



    elsif user.developer?
      can :read, Project, developer_id: user.id
      cannot :read, Bug,developer_id: user.id
      cannot :read, Join, developer_id: user.id
      cannot :new, Project, developer_id: user.id
      cannot :create, Project, developer_id: user.id
      cannot :destroy, Project, developer_id: user.id
      cannot :update, Project, developer_id: user.id
      cannot :edit, Project, developer_id: user.id

      cannot :new, Join, developer_id: user.id
      cannot :create, Join, developer_id: user.id
      cannot :new, Bug, developer_id: user.id
      cannot :create, Bug, developer_id: user.id
      # cannot :read, Bug, developer_id: user.id





    elsif user.QA?

      can :read, Project, QA_id: user.id
      can :read, Bug, QA_id: user.id
      # can :read, Join, manager_id: user.id
      cannot :new, Project, QA_id: user.id
      cannot :create, Project, QA_id: user.id
      cannot :destroy, Project, QA_id: user.id
      cannot :update, Project, QA_id: user.id
      cannot :edit, Project, QA_id: user.id

      cannot :new, Join, QA_id: user.id
      cannot :create, Join, QA_id: user.id
      can:new, Bug, QA_id: user.id
      can :create, Bug, QA_id: user.id

    end


    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
