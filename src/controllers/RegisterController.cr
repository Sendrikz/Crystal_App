require "kemal"
require "../models/*"

post "/register-me" do |env|
  email = env.params.body["email"].as(String)
  password = env.params.body["password"].as(String)
  confirm_password = env.params.body["confirm_password"].as(String)
  name = env.params.body["name"].as(String)
  surname = env.params.body["surname"].as(String)
  year_of_study = env.params.body["year_of_study"].as(String).to_i
  faculty = env.params.body["faculty"].as(String)

  user = User.build({:name => name, :surname => surname, :email => email,
    :year_of_study => year_of_study, :faculty => faculty})
  user.password = password

  user.save
  user.addRole("Student")

  render "src/views/home.ecr"
end
