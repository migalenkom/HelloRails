module Permissions
  class GuestPermission < BasePermission
    def initialize
      allow :users, [:new, :create,:resetpass]
      allow :sessions, [:new, :create, :destroy]
    end
  end
end
