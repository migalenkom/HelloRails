module Permissions
  class MemberPermission < BasePermission
    def initialize(user)
      allow :users, [:new, :create, :edit, :update,:resetpass,:show]
      allow :sessions, [:new, :create, :destroy]
      allow :uploads, [:index,:new,:create,:destroy,:update,:show]
      allow :organizations, [:index,:new,:create,:destroy,:update,:show,:edit]
      allow :projects, [:index,:new,:create,:destroy,:update,:show,:edit]
      allow :organizations, [:index,:new,:create,:show,:update]
      allow :organizations, [:destroy,:edit] do |o|
        o.creator_id == user.id
      end
      allow :projects, [:index,:new,:create,:destroy,:update,:show,:edit]
      allow :members, [:index]
      allow :members,[:new,:create,:destroy]
      # allow_param :name, :email
    end
  end
end
