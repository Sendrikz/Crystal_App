require "kemal"

get "/" do
  render "src/views/home.ecr"
end

get "/home" do
  render "src/views/home.ecr"
end

error 500 do
  "Oooops, something goes wrong. Sorry! \n Check if all data where typped correctly."
end
