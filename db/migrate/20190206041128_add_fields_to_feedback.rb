class AddFieldsToFeedback < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :email_address, :string
    add_column :feedbacks, :importance, :string
  end
end
