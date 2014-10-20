class HomeScreen < PM::GroupedTableScreen
  title "About"

  def table_data
    [{
      title: 'LeanMotion',
      cells: [
        { title: '网站', action: :website },
        { title: '版本：0.1'} 
      ]
    },
    {
      title: '联系',
      cells: [
        { title: '作者：张泽涛'},
        { title: '公司：恰恰网络', action: :chacha},
        { title: '邮箱：sam@chamobile.com'},
        { title: '微信：smartweb'}
      ]
    }]
  end

  def website
    open WebScreen.new(url: 'http://github.com/smartweb/leanmotion')
  end

  def chacha
    open WebScreen.new(url: 'http://chamobile.avosapps.com/')
  end

end