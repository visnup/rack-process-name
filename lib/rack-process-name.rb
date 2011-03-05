module Rack
  class ProcessName
    def initialize(app)
      @app = app
      @name = $0
    end

    def call(env)
      req = Rack::Request.new(env)
      $0 = "#{@name}: *#{req.request_method} #{req.url}"
      @app.call(env).tap do
        $0 = "#{@name}:  #{req.request_method} #{req.url}"
      end
    end
  end
end
