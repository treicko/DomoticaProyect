class User < ActiveRecord::Base
  rolify
  #resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :locations, :dependent => :destroy
  has_many :termometros, :through => :locations, :source => :thermostats 

  def self.with_role(role)
     my_role = Role.find_by_name(role)
     where(:role => my_role)
  end
  
  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end

end
