Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#index'

  resource 'movies' do
    collection do
      post 'delete_movie'
      post 'update'
      get 'list'
    end
  end

  resource 'tags' do
    collection do
      get 'list'
    end
  end

  resource 'menus' do
    collection do
      post 'list'
      post 'update'
      post 'delete_menu'
      get 'grid_list'
    end
  end
end
