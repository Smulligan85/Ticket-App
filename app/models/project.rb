class Project < ActiveRecord::Base

  has_many :tickets, dependent: :delete_all
  has_many :roles, dependent: :delete_all

  validates :name, presence: true

  def has_member?(user)
    roles.exists?(user_id: user)
  end

  [:manager, :viewer, :editor].each do |role|
    define_method "has#{role}?" do |user|
      roles.exists?(user_id: user, role: role)
    end
  end
  
end
