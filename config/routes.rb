Rails.application.routes.draw do
  get "/users", to: "users#all"
  get "/users/:id", to: "users#get"
  post "/users", to: "users#create"
  put "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#delete"
end
