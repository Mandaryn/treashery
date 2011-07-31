Treashery::Application.routes.draw do
  match "faq" => "pages#faq", :as => :faq
  match "about" => "pages#about", :as => :about
  match "contact" => "pages#contact", :as => :contact

  resources :localities

  resources :spots
  root :to => 'spots#index'
end
