ActiveAdmin.register Article do
  permit_params :title, :image, :body, :directorate_id, :user_id
end
