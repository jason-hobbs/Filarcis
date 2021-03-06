Rails.application.routes.draw do

  resources :projects do
    resources :contents do
      collection do
        delete 'destroy_multiple'
      end
      collection do
        get 'movefile'
      end
      collection do
        get 'view_file'
      end
      collection do
        get 'share'
      end
      collection do
        get 'download_file'
      end
      collection do
        get 'justentries'
      end
    end
    resources :notes do
      collection do
        delete 'destroy_multiple'
      end
    end
  end

  post 'noteupload' => 'notes#upload_file'

  resources :search, only: [:index]

  get 'justsearch' => 'search#justsearch'

  resources :users
  root 'dashboards#index'

  get 'signin' => 'sessions#new'
  resource :session

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :dashboards, only: [:index]

  resource :github_webhooks, only: :create, defaults: { formats: :json }

end
