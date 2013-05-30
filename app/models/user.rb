class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  has_many :pins


  has_attached_file :photo,
                  :storage => :s3, 
                  :s3_credentials => "#{Rails.root}/config/s3.yml",
                  :path => "user/:attachment/:style/:id.:extension"

end

