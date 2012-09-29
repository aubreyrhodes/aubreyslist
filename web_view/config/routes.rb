WebView::Application.routes.draw do
  resources :items do
    put :check, on: :collection
  end

  root to: 'items#index'
end
