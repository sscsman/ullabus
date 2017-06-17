class ComNotifyMail < ApplicationMailer

  def commentnotify(address, courseid)
    @title = Course.find(courseid).coursename
    @id = courseid.to_s
    mail bcc: address, subject: @title + "にコメントが投稿されました -ウラバス"

  end


end
