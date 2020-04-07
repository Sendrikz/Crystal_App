require "kemal"

get "/" do
  render "src/views/home.ecr"
end

get "/home" do
  render "src/views/home.ecr"
end
