module Rack
  class ProcessName
    def initialize(app)
      @app = app
      @name = $0
    end

    def call(env)
      req = Rack::Request.new(env)
      info = "#{req.request_method} #{req.url}"

      set(info, "*")
      @app.call(env).tap { set(info, ".") }
    rescue
      set(info, "!")
      raise
    end

    def set(info, state = nil)
      $0 = "#{@name} #{state}#{info}"
    end
  end
end
