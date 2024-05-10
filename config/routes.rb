Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'attendance/index'
  root 'attendance#index'
  get 'attendance/download_excel', to: 'attendance#download_excel'
  get 'attendance/employee_excel', to: 'attendance#employee_excel'
  get 'attendance/flow'
end
