class ContactMailer < ApplicationMailer
  def contact_mail(email, post)
    @post = post
    mail to: "sample@sample.com", subject: "投稿が完了しました！"
  end
end
