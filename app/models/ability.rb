class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    can :read, all
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :destroy, Group do |group|
        group.user.id == user.id
      end

      can :destroy, Expense do |expense|
        expense.user.id = user.id
      end
    end
  end
end
