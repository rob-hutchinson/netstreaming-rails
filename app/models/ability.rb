class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.plan == "silver" || user.plan == "gold"
      can :stream, :all
    end
  end
end
