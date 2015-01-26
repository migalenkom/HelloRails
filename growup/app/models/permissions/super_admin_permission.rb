module Permissions
  class SuperAdminPermission < BasePermission
    def initialize(user)

      # allow_all
      allow :users, [:index,:show]
      allow :users, [:edit]
      allow :users, [:destroy] do |u|

        u.id != user.id

      end
      allow :users, [:new, :create]
      allow :sessions, [:new, :create, :destroy]

      allow_param :user, :isAdmin
      allow_param :user, :password
      allow_param :user, :password_confirmation
    end
  end
end