class Message < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    text: String,
    user_id: Int32,
    community_group_id: Int32,
    created_at: Time?,
    updated_at: Time?,
  )

  belongs_to :users, User

  def self.getAllMessagesByGroup(group) : Array(MessageDTO)
    message_record = Message.all
                    .where {_community_group_id == group.id}
                    .relation(:users)
                    .select { [User._name, User._surname, _text, _created_at] }
                    .results.to_a

    all_messages_from_group = Array(MessageDTO).new
    message_record.each do |record|
      message = MessageDTO.new(record.name.to_s, record.surname.to_s, record.text.to_s, record.created_at.to_s)
      all_messages_from_group << message
    end
    all_messages_from_group
  end

end
