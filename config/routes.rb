Rails.application.routes.draw do

  get 'hello', to: 'pages#hello'
  get 'sum', to: 'pages#sum'
  get 'reverse-words', to: 'pages#reverse_words'
end
