module UsersHelper
    def get_roles
        Admin.roles.map {|k, v| [k.humanize.titleize, k]}
    end

end
