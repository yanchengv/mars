Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'movies#index'
  get '/admin' => 'admin_homes#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/sign_up', to: 'sessions#sign_up'
  post '/sign_up', to: 'sessions#create'
  get 'log_out', to: 'sessions#destroy'

  resources 'movies' do
    collection do
      get 'get_movies'
      get 'search'
    end
  end

  resources 'movie_comments'

  resources 'news'
  resources 'blogs'
  resources 'books'

  resources 'images' do
    collection do
      post 'remote_upload'
      get 'show_delete'
      post 'delete_img'
      get 'ueditor_upload'
    end

  end

  resources 'admin_books' do
    collection do
      post 'update'
      post 'delete'
      post 'update_menu'
      post 'delete_menu'
      post 'create_menu'
      post 'create_book_detail'
    end
  end

  resources 'admin_movies' do
    collection do
      post 'delete_movie'
      post 'update'
      get 'list'
      get 'get_movie_by_id'
      get 'update_form'
      post 'search'
      get 'is_not_all'
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
    end
  end
  resources 'admin_news' do
    collection do
      post 'update'
      post 'delete_news'
    end
  end


end
