class AddPhonenoToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :phoneno, :string
  end
end
