module Users
  class Form < User
    include Devise::ResourceValidations
  end
end
