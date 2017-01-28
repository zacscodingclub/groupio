Rails.application.routes.draw do
  get '/members', to: 'users#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'pages#home'
end

# Adds routes for any subdomain that is not www
# constraints SubdomainConstraint do
#   resources :projects
# end

class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w(www admin)
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end
