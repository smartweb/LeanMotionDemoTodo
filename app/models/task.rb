class Task
  include LeanMotion::Model

  fields :user, :content, :status

  def done
    self.status = 1
    self.save
  end

  def undone
    self.status = 0
    self.save
  end

end