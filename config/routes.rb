SevenCareers::Engine.routes.draw do
  resources :jobs do
    resources :candidates, except: [:index, :edit, :update] do
      get 'sendresume' => 'candidates#send_resume', as: :candidate_send_resume
      post 'assignstatus' => 'candidates#ajax_assign_status', as: :assign_candidate_status
      resources :candidate_statuses
    end
  end
end
