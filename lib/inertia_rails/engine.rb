require_relative "middleware"
require_relative "controller"

module InertiaRails
  class Engine < ::Rails::Engine
    initializer "inertia_rails.configure_rails_initialization" do |app|
      app.middleware.use ::InertiaRails::Middleware
    end

    initializer "inertia_rails.action_controller" do
      ActiveSupport.on_load(:action_controller_base) do
        include ::InertiaRails::Controller
      end
    end

    initializer "inertia_rails.streaming" do
      ActiveSupport.on_load(:action_controller) do
        include InertiaRails::Streaming::ControllerMethods # FIXME: better naming?
      end

      ActiveSupport.on_load(:active_job) do
        include InertiaRails::Streaming::ControllerMethods
      end
    end
  end
end
