class Member < ActiveRecord::Base

  ratyrate_rater

  has_many :ads
  has_one :profile_member
  accepts_nested_attributes_for :profile_member

  validate :nested_attributes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def nested_attributes
   if nested_attributes_blank?
     errors.add(:base, "É necessário preencher os campo Nome e Sobrenome.")
   end
  end

  def nested_attributes_blank?
    profile_member.first_name.blank? || profile_member.last_name.blank?
  end
end
