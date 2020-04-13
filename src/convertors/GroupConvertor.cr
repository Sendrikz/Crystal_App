require "../models/*"
require "../dto/*"

class GroupConvertor

  def convertGroupToGroupDTO(group) : GroupDTO
     GroupDTO.new(group.id, group.name)
  end

end
