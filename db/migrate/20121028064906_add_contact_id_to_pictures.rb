class AddContactIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :contact_id, :integer
  end
end
