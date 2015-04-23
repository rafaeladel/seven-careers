SevenCareers::Engine.routes.draw do
  resources :candidate_statuses
  resources :jobs
  resources :candidates

  post 'candidates/:id/assignstatus' => 'candidates#ajax_assign_status', as: :assign_candidate_status

  post 'jobs/:id/apply' => 'jobs#apply', as: :job_apply

  get 'jobs/:id/candidates' => 'jobs#show_applied_candidates', as: :job_show_applied_candidates

  get 'candidates/:id/sendresume' => 'candidates#send_resume', as: :candidate_send_resume
end
