Clevercode::Application.routes.draw do

  root to: 'pages#home'

  match 'home', to: 'pages#home'
  match 'work', to: 'pages#work'
  match 'contact', to: 'pages#contact'

  post 'send_cleverContact', to: 'pages#email', as: 'send_cleverContact'

end
