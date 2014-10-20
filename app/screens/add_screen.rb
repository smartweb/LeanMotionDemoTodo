class AddScreen < PM::Screen
  title "添加任务"

  attr_accessor :delegate

  def delegate=(parent)
    @delegate = WeakRef.new(parent)
  end

  def on_load
    view.backgroundColor = UIColor.whiteColor

    set_nav_bar_button :left, title: '取消', action: :close_screen
    set_nav_bar_button :right, title: '保存', action: :save

    @task = UITextField.alloc.initWithFrame([[10,74], [300,30]])
    @task.placeholder     = '请输入任务'
    @task.borderStyle     = UITextBorderStyleRoundedRect
    @task.delegate        = self
    
    view.addSubview(@task)

    @task.becomeFirstResponder
  end


  def save
    if @task.text == ''
      @task.becomeFirstResponder
      return
    else
      new_task = Task.new
      new_task.content = @task.text
      new_task.status  = 0
      if new_task.save
        if @delegate.respond_to? :after_add
          @delegate.after_add(new_task)
        end
        close_screen
      end
    end
  end

end