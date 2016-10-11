Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'homes#index'
  get '/admin' => 'admin_homes#index'

  resource 'admin_movies' do
    collection do
      post 'delete_movie'
      post 'update'
      get 'list'
    end
  end

  resource 'admin_movie_details' do
    collection do
      post 'delete_movie_detail'
      post 'update'
      get 'list'
    end
  end

  resource 'admin_tags' do
    collection do
      get 'list'
      post 'update'
      post 'delete_tag'
    end
  end

  resource 'admin_menus' do
    collection do
      post 'list'
      post 'update'
      post 'delete_menu'
      get 'grid_list'
    end
  end
end
