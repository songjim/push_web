class ErrorMailer < ApplicationMailer
  def error_maile(err,res)
    @err = err
    @res = res
    mail(to: "809587614@qq.com", subject: "error")
  end
end
