Blog::Application.routes.draw do
  namespace :api do
    resources :posts do
      scope module: :posts do
        resources :comments
      end
    end
  end

  scope module: :web do
    get "welcome/index"
    resources :posts do
      scope module: :posts do
        resources :comments
      end
    end
    resources :users
    resource :session

    root 'welcome#index'
  end
end
