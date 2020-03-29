class MessageDTO
  getter name : String
  getter surname : String
  getter text : String
  getter created_at : String

  def initialize(@name, @surname, @text, @created_at)
  end

  JSON.mapping(
    text: String,
    name: String,
    surname: String,
    created_at: String
  )

end
