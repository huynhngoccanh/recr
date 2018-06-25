class Coach < ApplicationRecord
  include Picturable

  has_one :user, as: :profile
  has_many :phone_numbers, as: :owner
  has_one :affiliation, dependent: :destroy

  accepts_nested_attributes_for :phone_numbers, allow_destroy: true, reject_if: :all_blank
  validates_presence_of :role, :role_name, :first_name, :last_name

  enum role: { standard: 0, head_coach: 1}

  mount_uploader :avatar, AvatarUploader

  def name
    "#{first_name} #{last_name}"
  end

  def conversable
    school
  end

  def affiliated?
    school.present?
  end

  def organization
    affiliation&.organization if affiliation
  end

  def school
    affiliation&.organization
  end
end
