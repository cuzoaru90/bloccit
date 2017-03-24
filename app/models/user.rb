class User < ActiveRecord::Base

  before_save { self.email = email.downcase if email.present? }
  before_save { :capitalize if name.present?}

 
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 
  validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true
 
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

   has_secure_password

   def capitalize
     @first_last = self.name.split(" ")

     @first_last.each do |i|
       i.capitalize!
     end

     @first_last.join(" ")
   end


end
