ActiveAdmin.register Executive do
  permit_params :name, :position, :image, :research_interest, :education, :expertise, :description
end
