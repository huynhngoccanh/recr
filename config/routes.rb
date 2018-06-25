Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "accounts/sessions",
    registrations: "accounts/registrations",
    passwords: "accounts/passwords",
    invitations: 'accounts/invitations',
    omniauth_callbacks: 'accounts/omniauth_callbacks'
  }

  # General Public Links
  get :index, to: "home#index", as: :home
  get :about, to: "home#about", as: :about
  get :terms, to: "home#terms", as: :terms
  get :advertise, to: "home#advertise", as: :advertise
  get :contact, to: "home#contact", as: :contact
  get :who_is_that, to: "home#who_is_that", as: :who_is_that

  get :update_online_time, to: 'home#update_online_time'

  resources :schools, only: [:index]

  namespace :high_schools do
    get :autocomplete, to: "autocompletes#index"
  end

  # General Authenticated User Links
  resources :highlights, only: [:show] do
    get :search, on: :collection, to: "highlights/searches#index"
    post :like, on: :member, to: "highlights/votes#like"
    post :unlike, on: :member, to: "highlights/votes#dislike"
  end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  resources :transcript_requests, only: [:create]
  resources :connections, only: [:index]

  # Registration Links
  resources :high_school_onboardings, only: [:new, :create]
  resources :college_onboardings, only: [:new, :create]

  # Membership Model Links (Profiles & Administration Areas)
  namespace :athletes, except: [:edit, :update] do
    resource :registrations, only: [:new, :create, :edit, :update]
    namespace :administration do
      resources :athletes, only: [:edit, :update]
      resources :contact_info, only: [:update]
    end
  end

  resources :athletes, except: [:new, :create] do
    scope module: "athletes" do
      resources :enrollments

      resources :highlights,  only: [:index, :show]
      resources :articles,    only: [:index, :show]
      resources :connections, only: [:index]
      resources :stats,       only: [:index]
      resources :references,  only: [:index]

      namespace :administration do
        resources :highlights
        resources :articles
        resources :connections
        resources :stats
        resources :references
      end

      resources :stats, except: [:show] do
        get "edit", to: "stats#edit_index", on: :collection
        post "primary_position", to: "stats#primary_position"
      end

      resources :conversations do
        get "edit", to: "conversations#edit_index", on: :collection
        resources :messages, only: [:create], module: "conversations"
      end
    end
  end

  resources :colleges do
    scope module: "colleges" do
      resources :connections, only: [:index, :create]
      resources :highlights,  only: [:index, :show]

      namespace :administration do
        resources :connections
        resources :highlights
        resources :affiliations
        resources :coaches, only: :update
        resources :coach_invitations do
          get :add_new_invite_field, on: :collection
        end
      end

      resources :conversations do
        get "edit", to: "conversations#edit_index", on: :collection
        resources :messages, only: [:create], module: "conversations"
      end

      resources :users do
        get "edit", to: "users#edit_index", on: :collection
      end
    end
  end

  resources :high_schools do
    scope module: "high_schools" do
      get "roster", to: "rosters#index"

      resources :connections, only: :index
      resources :highlights, only: [:index, :show]

      namespace :administration do
        resources :connections
        resources :highlights
        resources :affiliations
        resources :coaches, only: :update
        resources :coach_invitations do
          get :add_new_invite_field, on: :collection
        end
        resources :athlete_invitations do
          get :summary, on: :collection
          get :add_new_invite_field, on: :collection
        end
      end

      resources :enrollments do
        get "edit", to: "enrollments#edit_index", on: :collection
      end

      collection do
        get "registrations/new", to: "registrations#new", as: :new_registration
        post "registrations", to: "registrations#create", as: :registration
      end

      resources :conversations do
        get "edit", to: "conversations#edit_index", on: :collection
        resources :messages, only: [:create], module: "conversations"
      end

      resources :users do
        get "edit", to: "users#edit_index", on: :collection
      end
    end
  end

  resources :coaches, only: [:show, :edit, :update] do
    post "order", on: :collection
  end

  namespace :profile do
    resources :connections, only: [:create, :update]
  end

  resources :coaches, only: [:create, :update, :destroy]

  get :health, to: "health#index"
  post :reindex, to: "health#reindex"
  resource :dashboard do
    collection do
      post :become_user
    end
  end

  resources :conversations do
    post :create_new_message, on: :member
  end
  # Administrate Routes
  namespace :admin do
    resources :users
    resources :addresses
    resources :affiliations
    resources :articles
    resources :athletes
    resources :coaches
    resources :colleges
    resources :connections
    resources :conversations
    resources :enrollments
    resources :high_schools
    resources :highlights
    resources :messages
    resources :notifications
    resources :phone_numbers
    resources :references

    root to: "users#index"
  end

  root to: "home#index"
  mount ActionCable.server => '/cable'
end
