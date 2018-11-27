ActiveAdmin.register Manuscript do
  permit_params :title, :journal_id, :abstract, :approval, :document, :image, :volume, :issue
end
