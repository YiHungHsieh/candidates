Rails.application.routes.draw do
	# get "/", to:"welcome#index"
	root "welcome#index"
	resources :candidates do 
		member do
			post :vote
		end
	end
	# post "/candidates/:id/vote". to: "candidates#vote"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
