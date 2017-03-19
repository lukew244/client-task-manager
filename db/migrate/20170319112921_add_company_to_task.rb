class AddCompanyToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :company, :string
  end
end
