# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    body_sha = Digest::SHA2.new(256).hexdigest body
    if status == 200
      [200, headers, "#{body}\n#{body_sha}"]
    else
      [status, headers, body]
    end
    # END
  end
end
