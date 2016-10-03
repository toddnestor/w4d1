require 'addressable/uri'
require 'rest-client'

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: name, email: email } }
  )
end

def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users',
      query_values: {
      }
    ).to_s

    puts RestClient.get(url)
end

def show_user(id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}"
  ).to_s

  puts RestClient.get(url)
end

def destroy_user(id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}"
  ).to_s

  puts RestClient.delete(url)
end

def update_user(id, name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}"
  ).to_s

  puts RestClient.patch(url, { user: { name: name, email: email } })
end
# create_user("Gizmo2", "gizmo2@gizmo.gizmo")
update_user(2, "Tyler", "thatone")
create_user("Gizmo2", "gizmo2@gizmo.gizmo")
destroy_user(3)
index_users
