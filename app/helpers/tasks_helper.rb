module TasksHelper
  def render_rule_task_select_tag(task) 
    return if task.blank?
    collection_select :task, :rule_id, Rule.all, :id, :name, {:prompt => 'select', :style => "width:145px;"}
  end
end
