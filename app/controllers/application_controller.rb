class ApplicationController < ActionController::Base
  include ApplicationHelper

  def validate_creds
    auth = Rack::Auth::Basic::Request.new(request.env)

    if !auth.provided? || !auth.basic? || (auth.credentials != [ENV['CONFLUX_USERNAME'], ENV['CONFLUX_PASSWORD']])
      render json: { message: 'Invalid credentials' }, status: 401
    end
  end

end
