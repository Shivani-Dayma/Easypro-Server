class CreateWorkFlowWorkflowroles < ActiveRecord::Migration[7.0]
  def change
    create_table :work_flow_workflowroles do |t|

      t.timestamps
    end
  end
end
