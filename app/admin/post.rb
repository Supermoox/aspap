ActiveAdmin.register Post do
  permit_params :title, :body, :directorate_id
end
