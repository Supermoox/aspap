ActiveAdmin.register Article do
  permit_params :title, :image, :body, :user_id
end
