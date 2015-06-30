class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #:confirmable

         has_many :todoos


         def admin?
            role == 'admin'
         end

         def moderator?
            role == 'moderator'
         end

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
