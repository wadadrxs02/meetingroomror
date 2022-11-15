module PartialHelper
  def get_roles
    User.roles.map { |k, v| [k.humanize.titleize, k] }
  end

   def get_room_type
    Meetingroom.room_types.map { |k, v| [k.humanize.titleize, k] }
  end
end
