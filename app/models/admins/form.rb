module Admins
  class Form < User
    include Devise::ResourceValidations
  end
end
