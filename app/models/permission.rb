class Permission < Struct.new(:user)
  def allow?(controller, action)
    # return true
    return true if controller == "dermalog"
    return true if controller == "sessions"
    return true if controller == "doctors" && action.in?(%w[new create])
    if user
      return true 
      return true if user.admin?
    end
    false
  end
end