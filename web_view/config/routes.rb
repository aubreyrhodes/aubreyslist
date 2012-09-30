CheckList::WebView::Application.routes.draw do
  resources :items do
    put :check, on: :collection
  end

  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"

  resources :sessions, only: :new

  root to: 'items#index'
  mount Foundation::Icons::Rails::Engine => '/fi'
end
