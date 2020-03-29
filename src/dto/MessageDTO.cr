class MessageDTO
  getter name : String
  getter surname : String
  getter text : String

  def initialize(@name, @surname, @text)
  end

  JSON.mapping(
    text: String,
    name: String,
    surname: String
  )

end
