require "kemal"

get "/" do
  render "src/views/home.ecr"
end

get "/home" do
  render "src/views/home.ecr"
end

get "/login" do
  render "src/views/login.ecr"
end

get "/registration" do
  render "src/views/registration.ecr"
end
