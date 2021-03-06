Rails.application.routes.draw do
  get 'hello', to: 'pages#hello'
  get 'sum', to: 'pages#sum'
  get 'reverse-words', to: 'pages#reverse_words'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
