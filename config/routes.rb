Treashery::Application.routes.draw do
  match "faq" => "pages#faq", :as => :faq
  match "about" => "pages#about", :as => :about
  match "contact" => "pages#contact", :as => :contact

  resources :localities, only: [:show, :search] do
    get 'search', on: :collection
  end

  resources :spots
  root :to => 'spots#index'
end
