Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # create a new stateless boggle board layout and shuffle it
  post 'v1/board', to: "board#create"
  
  # post a word to the boggle game - will verify if it is a legitimate word
  # could use get v1/words/:id but thinking of posting board layout
  # for validation purposes such as letters exist on board and
  # letters are adjacent to each other.
  post 'v1/words', to: "words#create"
  
end
