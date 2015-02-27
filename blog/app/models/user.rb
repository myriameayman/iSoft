class User < ActiveRecord::Base  
  #attr_accessible :email, :password_hash, :password_salt, :password, :password_confirmation
  #require 'bcrypt'
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  attr_accessor :password,:password_confirmation

  #attr_accessor :password_salt
  before_save { self.email = email.downcase }

  #validates :email, :presence =>true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }  
                    
  validates :password, :presence =>true,
                    :length => { :minimum => 5, :maximum => 40 }
                    
  before_save :encrypt_password 


  validates_confirmation_of :password

  #validates_presence_of :password, :on => :create

  #validates_presence_of :email

  #validates_uniqueness_of :email
  

  def encrypt_password

    if password.present?

      self.password_salt = BCrypt::Engine.generate_salt

      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)

    end  

  end

  def self.authenticate(email, password)  
    user = find_by_email(email)  
    if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)  
      user  
    else  
      nil  
    end   
  end

end