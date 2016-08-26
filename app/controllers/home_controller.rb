class HomeController < ApplicationController

  def dashboard
    render json: {}
  end

  def sso
    pre_token = "#{params[:uuid]}:#{ENV['CONFLUX_SSO_SALT']}:#{params[:timestamp]}"
    token = Digest::SHA1.hexdigest(pre_token).to_s

    if token != params[:token] || params[:timestamp].to_i < (Time.now - 2*60).to_i
      render json: { message: 'Forbidden' }, status: 403
      return
    end

    resource = Resource.find_by(uuid: params[:uuid])

    if resource.nil?
      render json: { message: 'Resource not found' }, status: 404
      return
    end

    session[:user] = resource.uuid
    session[:conflux_sso] = true

    redirect_to '/dashboard'
  end

end