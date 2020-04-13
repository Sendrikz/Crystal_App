require "kemal"
require "kemal-session"

class GroupDTO
  JSON.mapping({
    id: Int32?,
    name: String
  })
  include Kemal::Session::StorableObject

  def initialize(@id : Int32?, @name : String); end

end
