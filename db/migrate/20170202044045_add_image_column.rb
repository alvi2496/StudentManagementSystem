class AddImageColumn < ActiveRecord::Migration[5.0]
  def change
    add_column("users", "image", :string, :after => "contact_number")
  end
end
