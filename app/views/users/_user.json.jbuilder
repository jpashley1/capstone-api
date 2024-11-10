# app/views/users/_user.json.jbuilder
json.id user.id
json.name user.name
json.username user.username
json.bio user.bio
json.email user.email
json.created_at user.created_at
json.updated_at user.updated_at

# Add image if attached
if user.profile_pic.attached?
  json.profile_pic_url url_for(user.profile_pic)
else
  json.profile_pic_url nil
end
