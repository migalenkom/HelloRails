module Permissions
  class AdminPermission < BasePermission
    def initialize(user)

      # allow_all
      allow :users, [:index]
      allow :users, [:edit] do |u|

        u.id==user.id

      end
      allow :users, [:new, :create,:destroy]
      allow :sessions, [:new, :create, :destroy]
    end
  end
end