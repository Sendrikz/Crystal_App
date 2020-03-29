require "../models/*"
require "../dto/*"

class UserConvertor

  def convertUserToUserDTO(user) : UserDTO
     UserDTO.new(user.id, user.email, user.name, user.surname, user.year_of_study, user.faculty)
  end

  def convertUserDTOToUser(session_user) : User
    User.all.where { _email == session_user.email }.first.not_nil!
  end

end
