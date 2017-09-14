module UsersHelper
  def is_admin(user)
    if user.is_admin == 1
      true
    else
      false
    end
  end
end
