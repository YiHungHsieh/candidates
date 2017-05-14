# class WelcomeController < ApplicationController
# 	def index
# 	end
# end
Rails.application.routes.draw do

	root "welcome#index"
	resources :candidates
	# get "/candidates", to: "cancandidates#index"
	# get "/candidates/:id" to: "cancandidates#show"
end