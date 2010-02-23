authorization do
  role :landlord do
    #has_permission_on [:properties, :units, :applications], :to => [:index, :show, :new, :create, :edit, :update, :destroy]

    #Property Permissions
    has_permission_on [:properties], :to => [:index, :new, :create]
    has_permission_on [:properties], :to => [:show, :edit, :update, :destroy] do
      if_attribute :landlord => is {user}
    end

    #Unit Permissions
    has_permission_on [:units], :to => [:index, :new, :create, :new_application]
    has_permission_on [:units], :to => [:show, :edit, :update, :destroy] do
      if_attribute :property => {:landlord => is {user}}
    end

    #Leases Permissions
    has_permission_on [:leases], :to => [:index, :new, :create]
    has_permission_on [:leases], :to => [:show, :edit, :update, :destroy] do
      if_attribute :unit => {:property => {:landlord => is {user}}}
    end

    #Application Permissions
    has_permission_on [:applications], :to => [:index, :new, :create]
    has_permission_on [:applications], :to => [:show, :edit, :update, :destroy] do
      if_attribute :unit => {:property => {:landlord => is {user}}}
    end

  end

  role :tenant do
    #Leases Permissions
    has_permission_on [:leases], :to => [:index, :new, :create]
    has_permission_on [:leases], :to => [:show, :edit, :update] do
      if_attribute :tenant => is {user}
    end

    #Application Permissions
    has_permission_on [:applications], :to => [:index, :new, :create]
    has_permission_on [:applications], :to => [:show, :edit, :update, :destroy] do
      if_attribute :tenant => is {user}
    end

  end
end