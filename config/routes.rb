Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'homes#index'
  get '/admin' => 'admin_homes#index'

  resources 'admin_movies' do
    collection do
      post 'delete_movie'
      post 'update'
      get 'list'
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

  resources 'movies'
end
