authorization do
  role :member, :title => "Member" do
    description "The default role for authenticated user"
    #show/update account, invite friends
    has_permission_on :users, :to => [:show, :update, :create]
  end

  role :admin, :title => "Administrator" do
    description "The powerest role of the system"
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
    has_permission_on :users, :to => :manage
    has_permission_on :roles, :to => :manage
  end
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
