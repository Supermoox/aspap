ActiveAdmin.register User do
  permit_params :username, :email, :document, :institution, :field, :qualification, :year_completed, :title, :firstname, :PR, :middlename, :surname, :phone, :placeOfWork, :image, :vip, :editor, :publisher
end