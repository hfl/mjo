Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  resources :journals, :only => [:index, :show] do
    resources :contacts
    resources :issues, :only => [:index, :show] do
      resources :articles, :only => [:index, :show] do
        resources :authors
        resources :keywords
      end
    end
  end

  namespace :admin do
    resources :journals do
      resources :contacts
      resources :issues do
        resources :articles do
          resources :authors, :keywords
        end
      end
    end
    get 'about', to: 'dashboard#about'
    get 'help', to: 'dashboard#help' 
    root 'dashboard#index'
  end

  root 'journals#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
