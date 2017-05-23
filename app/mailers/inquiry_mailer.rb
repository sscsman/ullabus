class InquiryMailer < ActionMailer::Base
  default from: "urasyllabus@gmail.com"   # 送信元アドレス
  default to: "sscsman@gmail.com"     # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end
end
