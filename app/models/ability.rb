class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :stream, :all
    can :checkout, :all
  end
end
