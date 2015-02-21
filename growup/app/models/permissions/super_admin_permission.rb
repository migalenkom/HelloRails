module Permissions
  class SuperAdminPermission < BasePermission
    def initialize(user)

      # allow_all
      allow :users, [:new, :create,:edit,:index,:show,:sort,:resetpass]
      allow :users, [:destroy] do |u|

        u.id != user.id

      end
      allow :sessions, [:new, :create, :destroy]
      allow :uploads, [:index,:new,:create,:destroy,:update,:show]

      allow_param :user, :isAdmin
      allow_param :user, :password
      allow_param :user, :password_confirmation
    end
  end
end