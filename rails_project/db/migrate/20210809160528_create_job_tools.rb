class CreateJobTools < ActiveRecord::Migration[6.1]
  def change
    create_table :job_tools do |t|
      t.integer :job_id
      t.integer :tool_id

      t.timestamps
    end
  end
end
