class FavoriteMailer < ApplicationMailer
  default from: "cuzoaru90@gmail.com"

  def new_comment(user, post, comment)
 
     headers["Message-ID"] = "<comments/#{comment.id}@enigmatic-bayou-91789.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@enigmatic-bayou-91789.example>"
     headers["References"] = "<post/#{post.id}@enigmatic-bayou-91789.example>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end

end
