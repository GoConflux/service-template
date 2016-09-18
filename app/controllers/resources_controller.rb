class ResourcesController < ApplicationController

  before_filter :validate_creds

  def create
    resource = Resource.create!(
      conflux_id: params[:conflux_id],
      plan: params[:plan],
      url: generate_url,
      uuid: params[:uuid]
    )

    render json: {
      id: resource.uuid,
      config: {
        'FAKE_SERVICE_URL' => generate_url
      }
    }
  end

  def update
    resource = Resource.find_by(uuid: params[:uuid])
    resource.update_attributes(plan: params[:plan])
    render json: { message: 'Successfully updated plan for resource' }, status: 200
  end

  def destroy
    resource = Resource.find_by(uuid: params[:uuid])
    resource.destroy!
    render json: { message: 'Successfully destroyed resource' }, status: 200
  end

end