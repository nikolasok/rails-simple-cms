Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :page, only: [:new, :create, :edit, :update, :destroy, :show]

  get '/:id', to: 'page#show', as: :page_show
  root to: 'page#index'
end
