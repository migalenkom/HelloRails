module Permissions
  class AdminPermission < BasePermission
    def initialize(user)

      # allow_all
      allow :users, [:index,:new,:create,:sort,:resetpass]
      allow :users, [:edit] do |u|

        u.id==user.id

      end
      allow :users, [:destroy] do |u|

        u.superAdmin == false || u.id != user.id
      end
      allow :sessions, [:new, :create, :destroy]
      allow :uploads, [:index,:new,:create,:destroy,:update,:show]
    end
  end
end