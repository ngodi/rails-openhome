class Users::RegistrationsController < Devise::RegistrationsController

    protected
      def updated_resource(resource, params)
        resource.update_without_password(params)
      end

end