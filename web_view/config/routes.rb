WebView::Application.routes.draw do
  resources :items do
    put :check, on: :collection
  end
end
