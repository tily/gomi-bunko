# coding:utf-8

BY_AUTHOR  = URI.encode('作家別')
BY_BOOK    = URI.encode('作品別')
CONSONANT  = URI.encode('行')
SOUND      = URI.encode('50音')
HAYAWAKARI = URI.encode('早わかり')

Abendsonne::Application.routes.draw do
  get "fancies/name"
  get "fancies/mcguffin"

  match '/logout'                              => 'sessions#destroy',  :as => :logout
  get   ''                                     => 'welcome#index'
  get   '/hayawakari'                          => 'welcome#hayawakari'
  get   'new'                                  => 'authors#new'    ,:as => :new_author
  post  ''                                     => 'authors#create'
  get   ':author_name'                         => 'authors#show'   ,:as => :author
  get   ':author_name/edit'                    => 'authors#edit'   ,:as => :edit_author
  put   ':author_name'                         => 'authors#update'
  get   ':author_name/new'                     => 'books#new'      ,:as => :new_book
  post  ':author_name'                         => 'books#create'
  get   ':author_name/:book_title'              => 'books#show'     ,:as => :book
  get   ':author_name/:book_title/edit'         => 'books#edit'     ,:as => :edit_book
  put   ':author_name/:book_title'              => 'books#update'
  get   "/authors/consonant/:consonant" => 'authors#index'  ,:as => :authors
  get   "/books/sound/:sound"           => 'books#index'    ,:as => :books
  match '/auth/:provider/callback'             => 'sessions#callback', :as => :callback
end
