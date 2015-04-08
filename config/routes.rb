SevenCareers::Engine.routes.draw do
  resources :jobs
  resources :candidates

  post 'jobs/:id/apply' => 'jobs#apply', as: :job_apply

  get 'jobs/:id/candidates' => 'jobs#show_applied_candidates', as: :job_show_applied_candidates
end
