module Permissions
  class SuperAdminPermission < BasePermission
    def initialize(user)

      # allow_all
      allow :users, [:new, :create,:edit,:index,:show,:sort,:resetpass, :update]
      allow :users, [:destroy] do |u|

        u.id != user.id

      end
      allow :sessions, [:new, :create, :destroy]
      allow :uploads, [:index,:new,:create,:destroy,:update,:show]

      allow_param :user, [:name,:email,:isAdmin,:superAdmin,:password,:password_confirmation,:row_order,:avatar]

    end
  end
end