module PartialHelper
  def get_roles
    User.roles.map { |k, v| [k.humanize.titleize, k] }
  end
end
