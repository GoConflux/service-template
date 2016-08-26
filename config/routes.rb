Rails.application.routes.draw do

  scope :conflux do
    post '/resources' => 'resources#create'
    put '/resources/:uuid' => 'resources#update'
    delete '/resources/:uuid' => 'resources#destroy'
  end

end
