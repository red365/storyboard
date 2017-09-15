module UsersHelper
  def is_admin
    if current_user and current_user.is_admin == 1
      return true
    end
    false
  end
end
