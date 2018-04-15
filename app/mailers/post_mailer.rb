class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post
    mail to: post.user.email, subject: "POSTの確認メール"
  end
end
