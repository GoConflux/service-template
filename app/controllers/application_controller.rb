class ApplicationController < ActionController::Base

  def validate_creds
    auth = Rack::Auth::Basic::Request.new(request.env)

    puts auth.provided?
    puts auth.basic?
    puts auth.credentials
    puts [ENV['CONFLUX_USERNAME'], ENV['CONFLUX_PASSWORD']]

    if !auth.provided? || !auth.basic? || (auth.credentials != [ENV['CONFLUX_USERNAME'], ENV['CONFLUX_PASSWORD']])
      render json: { message: 'Invalid credentials' }, status: 401
    end
  end

end
