Rails.application.routes.draw do
    resources :cycles, only: [:index] do
        resources :invitations, only: [:new, :create]
    end
    root 'cycles#index'
end
