class User
  include LM::User

  # fields :column_name
  
  def self.current
    User.new AVUser.currentUser
  end

  # 是否存在
  def self.exist? username
    self.where(:username => username).count > 0
  end

  # 是否已登录
  def self.login?
    AVUser.currentUser ? true : false
  end


end