Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#index'

  resource 'movies' do
    collection do

    end
  end
end
