Rails.application.routes.draw do

  get '/dashboard' => 'home#dashboard'

  scope :conflux do
    post '/resources' => 'resources#create'
    put '/resources/:uuid' => 'resources#update'
    delete '/resources/:uuid' => 'resources#destroy'
    post '/sso' => 'home#sso'
  end

end
