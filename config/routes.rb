Rails.application.routes.draw do

  get '/:id' => 'eensify#show'
  get '/' => 'eensify#index'
  post '/' => 'eensify#create'

end
