Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#index'

  resource 'movies' do
    collection do
      post 'delete_movie'
      post 'update'
    end
  end

  resource 'tags' do
    collection do
      get 'list'
      get 'show'
    end
  end
end
