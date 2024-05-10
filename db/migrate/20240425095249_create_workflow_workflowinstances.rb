class CreateWorkflowWorkflowinstances < ActiveRecord::Migration[7.0]
  def change
    create_table :workflow_workflowinstances do |t|

      t.timestamps
    end
  end
end
