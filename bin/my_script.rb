require 'addressable/uri'
require 'rest-client'

#
# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.html'
# ).to_s
#
# # puts RestClient.get(url)
# # puts
# puts RestClient.post(url, {user: {name: 'Jeff', email: "stuff"}})

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(url, {user: {name: 'Gizmo' }})
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/4'
  ).to_s

  puts RestClient.patch(url, {user: {name: 'Gizmo' , email: 'gizmo@gizmo'}})
end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/5'
  ).to_s

  puts RestClient.delete(url)
end

def create_contact_share
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contact_shares'
  ).to_s

  puts RestClient.post(url, { contact_share: {user_id: 1, contact_id: 4} })
end

def delete_contact_share
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contact_shares/5'
  ).to_s

  puts RestClient.delete(url)
end

begin
  delete_contact_share
rescue => e
  p e
end
