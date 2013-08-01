class AddActivityStateToPost < ActiveRecord::Migration
  def change
    add_column :posts, :activity_state, :string
  end
end
