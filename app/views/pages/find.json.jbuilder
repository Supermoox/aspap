json.articles do 
	json.array!(@articles) do |article|
		json.title article.title
		json.name article.directorate.name
		json.firstname ""
		json.url article_path(article)
	end
end

json.users do 
	json.array!(@users) do |user|
		json.firstname user.firstname
		json.middlename user.middlename
		json.surname user.surname
		json.name user.field
		json.url user_path(user)
	end
end
