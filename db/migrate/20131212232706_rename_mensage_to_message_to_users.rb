class RenameMensageToMessageToUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :mensage, :message
  end
end
