require "kemal"
require "kemal-session"

class UserDTO
  JSON.mapping({
    id: Int32?,
    email: String,
    name: String,
    surname: String,
    year_of_study: Int32,
    faculty: String
  })
  include Kemal::Session::StorableObject

  def initialize(@id : Int32?, @email : String, @name : String,
    @surname : String, @year_of_study : Int32, @faculty : String); end

end
