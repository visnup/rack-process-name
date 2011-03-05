require "rack"

module Rack
  class ProcessName
    def initialize(app)
      @app = app
      @name = $0
    end

    def call(env)
      req = Rack::Request.new(env)
      info = "#{req.request_method} #{req.url}"

      set(info, "R")
      @app.call(env).tap { set(info, "S") }
    rescue
      set(info, "E")
      raise
    end

    def set(info, state = nil)
      $0 = "Rack: #{state} #{info}"
    end

    if defined?(Rails::Railtie)
      class Railtie < Rails::Railtie
        initializer "rack_process_name.use_middleware" do |app|
          app.config.middleware.use Rack::ProcessName
        end
      end
    end
  end
end
