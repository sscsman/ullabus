Rails.application.routes.draw do

  get 'comment/index'

  get 'comment/show'

  root to: 'registration#index'
  get 'mypage/index'


  # devise_for :users

  # get 'registration/index'

  # get 'registration/show'
  get "campus/campus"


  #root to: 'registration#index'
  #deviseのルート設定の場合は以下のように指定
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'registration#show', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'mypage#index', as: :unauthenticated_root
    end
  end
  resources :courses

  # ratings
  post '/rate/:id', to: 'courses#rate'
  patch '/rate/:id', to: 'courses#rate'

  post '/comm/:id', to: 'courses#comm'
  patch '/comm/:id', to: 'courses#comm'

  post '/vote/:gorb/:id', to: 'courses#vote'

  post '/like/:id', to: 'courses#like'
  post '/dislike/:id', to: 'courses#dislike'

  get  '/search/result', to: 'mypage#result'
  get  '/agreement', to: 'registration#agreement'

  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面

  delete '/comment/:id', to: 'comment#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
