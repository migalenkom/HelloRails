module Permissions
  class MemberPermission < BasePermission
    def initialize(user)
      allow :users, [:edit, :update]
      allow :users, [:new, :create]
      allow :sessions, [:new, :create, :destroy]

      # allow_param :name, :email
    end
  end
end
