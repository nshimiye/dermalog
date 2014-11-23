class Permission < Struct.new(:user)
  def allow?(controller, action)
    # return true
    return true if controller == "dermalog"
    return true if controller == "sessions"
    return true if controller == "doctors" && action.in?(%w[new create])
    # return true if controller == "users" && action.in?(%w[new create])
    # return true if controller == "topics" && action.in?(%w[index show])
    if user
      return true #if controller == "users" && action.in?(%w[edit update])
      # return true if controller == "topics" && action != "destroy"
      return true if user.admin?
    end
    false
  end
end