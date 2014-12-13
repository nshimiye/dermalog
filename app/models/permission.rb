class Permission < Struct.new(:user)
  def allow?(controller, action, resource)
    return true if controller == "dermalog"
    return true if controller == "sessions"
    return true if controller == "doctors" && action.in?(%w[new create])
    if user
      return true if controller == "doctors" && action.in?(%w[show edit update destroy]) && resource.id==user.id
      return true if controller == "case_logs" && action.in?(%w[show edit update destroy]) && (resource.doctor.id==user.id || Share.has_access_to_case_log(user, resource))
      return true if controller == "case_logs" && action.in?(%w[index new create])
      return true if controller == "images" && action.in?(%w[show edit update destroy]) && (resource.case_log.doctor.id==user.id || Share.has_access_to_case_log(user, resource.case_log))
      return true if controller == "images" && action.in?(%w[index new create])
      return true if controller == "shares" && action.in?(%w[show edit update destroy]) && (resource.doctor.id==user.id || resource.case_log.doctor.id==user.id)
      return true if controller == "shares" && action.in?(%w[index new create])
      return true if user.admin?
    end
    false
  end
end