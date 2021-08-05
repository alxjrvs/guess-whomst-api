Rails.application.routes.draw do
  get 'board', to: 'persons#index'
  get 'surprise', to: 'persons#show'
end
