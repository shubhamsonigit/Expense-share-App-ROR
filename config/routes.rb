Rails.application.routes.draw do
  get "/users", to: "users#all"
  get "/users/:id", to: "users#get"
  post "/users", to: "users#create"
  put "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#delete"

  get "/groups", to: "groups#all"
  get "/groups/:id", to: "groups#get"
  post "/groups", to: "groups#create"
  put "/groups/:id", to: "groups#update"
  delete "/groups/:id", to: "groups#delete"

  get "/audits", to: "audits#all"
  get "/audits/:id", to: "audits#get"
  post "/audits", to: "audits#create"
  put "/audits/:id", to: "audits#update"
  delete "/audits/:id", to: "audits#delete"

  get "/groupUsers", to: "group_users#all"
  get "/groupUsers/:id", to: "group_users#get"
  post "/groupUsers", to: "group_users#create"
  put "/groupUsers/:id", to: "group_users#update"
  delete "/groupUsers/:id", to: "group_users#delete"

end
