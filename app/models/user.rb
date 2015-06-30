class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :todoos

         def confirm!
         	welcome_email
         	super
         end

         private

         def welcome_email

         	if UserMailer.welcome_message(self).deliver
         		puts "Email sent"
         	end
         end
end
