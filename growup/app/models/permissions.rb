module Permissions
  def self.permission_for(user)
    if user.nil?
      GuestPermission.new
    elsif user.isAdmin?
      AdminPermission.new(user)
    elsif user.superAdmin?
      SuperAdminPermission.new(user)
    else
      MemberPermission.new(user)
    end
  end
end