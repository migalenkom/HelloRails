module Permissions
  class MemberPermission < BasePermission
    def initialize(user)
      allow :users, [:new, :create, :edit, :update,:resetpass,:show]
      allow :sessions, [:new, :create, :destroy]
      allow :uploads, [:index,:new,:create,:destroy,:update,:show]
      allow :organizations, [:index,:new,:create,:destroy,:update,:show,:edit]
      allow :projects, [:index,:new,:create,:destroy,:update,:show,:edit]

      # allow_param :name, :email
    end
  end
end
