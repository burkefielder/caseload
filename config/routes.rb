Rails.application.routes.draw do
  root 'students#index'
  get 'students' => 'students#index'
  get 'students/:id' => 'students#show', as: 'student'
  get 'students/:id/edit' => 'students#edit', as: 'edit_student'
end
