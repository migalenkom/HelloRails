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
      allow :organizations, [:index,:new,:create,:destroy,:update]
      allow :organizations, [:destroy,:edit] do |o|
        o.creator_id == user.id
      end
      allow :projects, [:index,:new,:create,:destroy,:update,:show,:edit]
      allow :members, [:index]
      allow :members, [:destroy,:new,:create] do |mbr|
        mbr.creator_id == user.id
      end
      allow :columns, [:index,:new,:create,:destroy,:update,:show,:edit]
      allow :tickets, [:index,:new,:create,:destroy,:update,:show,:edit]

      allow_param :user, [:name,:email,:isAdmin,:superAdmin,:password,:password_confirmation,:row_order,:avatar]

    end
  end
end