class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.


  def headers
    {
      :subject => "PHLC Message",
      :to => "mandieschad@gmail.com",
      #:to => "anderson.reinkordt@gmail.com",
      :from => %("#{name}" <#{email}>),
      :'reply_to' => %(#{email})
    }
  end
end
