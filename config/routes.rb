Rails.application.routes.draw do
  root to: redirect('/projects')
  resources :projects, only: [:index, :show, :new, :edit, :destroy]
  resources :projects, as: :project_forms, only: [:create, :update]
end
