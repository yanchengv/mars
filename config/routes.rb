Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'homes#index'
  get '/admin' => 'admin_homes#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#login'
  get '/sign_up',to: 'sessions#sign_up'
  post '/sign_up',to: 'sessions#create'
  get 'log_out',to: 'sessions#destroy'

  resources 'admin_movies' do
    collection do
      post 'delete_movie'
      post 'update'
      get 'list'
      get 'get_movie_by_id'
      get 'update_form'
    end
  end

  resources 'admin_movie_details' do
    collection do
      post 'delete_movie_detail'
      post 'update'
      get 'list'
    end
  end

  resources 'admin_tags' do
    collection do
      get 'list'
      post 'update'
      post 'delete_tag'
    end
  end

  resources 'admin_menus' do
    collection do
      post 'list'
      post 'update'
      post 'delete_menu'
      get 'grid_list'
    end
  end

  resources 'movies' do
    collection do
      get 'get_movies'
      get 'search'
    end
  end

  resources 'movie_comments'

  resources 'news'
  resources 'admin_news' do
    collection do
      post 'update'
    end
  end
end
