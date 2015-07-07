SevenCareers::Engine.routes.draw do
  resources :jobs do
    resources :candidates, except: [:index, :edit, :update]
  end
end
