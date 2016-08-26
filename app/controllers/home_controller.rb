class HomeController < ApplicationController

  def dashboard
    render json: {}
  end

  def sso
    pre_token = "#{params[:id]}:#{ENV['CONFLUX_SSO_SALT']}:#{params[:timestamp]}"
    token = Digest::SHA1.hexdigest(pre_token).to_s

    if token != params[:token] || params[:timestamp].to_i < (Time.now - 2*60).to_i
      render json: { message: 'Forbidden' }, status: 403
      return
    end

    # user = User.find_by(id: params[:id])
    #
    # if user.nil?
    #   render json: {}, status: 404
    #   return
    # end

    # session[:user] = user.id
    session[:user] = 123
    session[:conflux_sso] = true

    redirect_to '/dashboard'
  end

end