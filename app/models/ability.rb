class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :stream, :all
    can :checkout, :all
    can :checkin, :all
  end
end
