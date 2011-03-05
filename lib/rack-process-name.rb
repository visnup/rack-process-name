module Rack
  class ProcessName
    def initialize(app)
      @app = app
    end

    def call(env)
      req = Rack::Request.new(env)
      $0 = req.inspect
      @app.call(env)
    end
  end
end
