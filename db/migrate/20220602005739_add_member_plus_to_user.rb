class AddMemberPlusToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :member_plus, :boolean
  end
end
