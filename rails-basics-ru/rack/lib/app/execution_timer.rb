# frozen_string_literal: true

class Timer
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    runtime = headers['X-Runtime']
    [status, headers, "#{body}\n#{runtime}"]
  end
end
