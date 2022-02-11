Rails.application.routes.draw do
  #users related
  get "/users", to: "users#all"
  post "/users", to: "users#create"
  put "/users/:id", to: "users#update"

  #groups related
  post "/groups", to: "groups#create"

  #to add a transaction where a user pays for a group
  post "/audits", to: "audits#create"

  #to add a user to a group
  post "/group_users", to: "group_users#create"

  #others
  get "/balance_at_user_level/:id", to: "audits#get_balance_at_user_level"
  get "/balance_at_group_level/:id", to: "audits#get_balance_at_group_level"
  get "/transaction_date_wise/:id", to: "audits#get_transaction_date_wise"
end
