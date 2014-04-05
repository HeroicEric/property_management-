class Owner < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: {with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }

  has_many :buildings, foreign_key: 'owner_id', class_name: 'Building'
  
  def fullname
    "#{first_name} #{last_name}"
  end
end
