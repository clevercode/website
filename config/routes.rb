Clevercode::Application.routes.draw do

  root to: 'pages#home'
  match 'home', to: 'pages#home'
  match 'about', to: 'pages#about'
  match 'work', to: 'pages#work'
  match 'contact', to: 'pages#contact'

  match 'team/olivier', to: 'members#olivier'
  match 'team/andrew', to: 'members#andrew'
  match 'team/zachary', to: 'members#zachary'
  match 'team/alyssa', to: 'members#alyssa'

  resources :emails

end
