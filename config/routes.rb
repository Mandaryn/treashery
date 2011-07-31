Treashery::Application.routes.draw do
  get "pages/faq"
  match "faq" => "pages#faq", :as => :faq

  get "pages/about"
  match "about" => "pages#about", :as => :about

  get "pages/contact"
  match "contact" => "pages#contact", :as => :contact

  resources :localities

  resources :spots
  root :to => 'spots#index'
end
