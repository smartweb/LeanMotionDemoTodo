class TodoScreen < PM::TableScreen
  title "Todo"
  refreshable

  def on_load
    set_nav_bar_button :right, system_item: :add, action: :add

    @data = []
    load_data
  end

  def load_data
    
    # 默认每页20条
    Task.where(:status=>0).sort(:createdAt=>:desc).page(1).find do |tasks, error|
      if !error
        @data += tasks
        stop_refreshing
        update_table_data
      end
    end
  end

  def on_refresh
    @data = []
    @page = 1
    load_data
  end


  def add
    open_modal AddScreen.new(nav_bar: true, delegate: self)
  end

  def after_add(task)
    @data = [task] + @data
    update_table_data
  end


  def table_data
    [{
      cells: @data.map do |task|
        {
          title: task.content,
          action: :edit_task,
          arguments: { task: task }
        }
      end
    }]
  end

  def edit_task(task)

  end

end