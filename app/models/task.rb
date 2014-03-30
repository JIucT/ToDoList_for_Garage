class Task < ActiveRecord::Base
  belongs_to :project
  validates :name, presence: true, length: { in: 1..100 }
  validates :priority, numericality: { only_integer: true }
  before_create :set_priority
  before_destroy :shift_priority

  def set_priority
    self.priority = project.tasks.count
  end

  def up
    unless self.priority == 0 
      task_down = project.tasks.where(priority: priority - 1).first
      self.priority -= 1
      task_down.priority += 1
      self.save and task_down.save
    end
  end

  def down
    unless self.priority == project.tasks.count - 1  
      task_up = project.tasks.where(priority: priority + 1).first
      self.priority += 1
      task_up.priority -= 1
      self.save and task_up.save
    end
  end

  def shift_priority
    project.tasks.where('priority > ?',  priority).each do |task|
      task.priority -= 1
      task.save
    end
  end
end



