class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools do |t|

      t.timestamps
    end
  end
end
