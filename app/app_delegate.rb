class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    init_leancloud
      
    open_tab_bar TodoScreen.new(nav_bar: true), HomeScreen.new(nav_bar: true)

    init_data
  end

  # 初始化LeanCloud SDK
  def init_leancloud
    app_id   = "3sszo4jlsn5fdea2v09iycizmjph2ai4w350a73tf5jpnu6h"
    app_key  = "ciwyxupknzy14i1ezpdkfxhbmowjqd4if4it06doqvbglzq4" 
    
    LeanMotion::Config.init(app_id, app_key)
    LeanMotion::Config.channel 'Develop'
  end

  # 初始化数据
  def init_data
    if Task.count == 0
      todos = %w(添加LeanMotion测试 添加Demo 完善文档)
      todos.each do |t|
        task = Task.new
        task.content = t
        task.status  = 0
        task.save
      end
    end
  end

end

