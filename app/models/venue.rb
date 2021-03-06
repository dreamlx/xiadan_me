class Venue < ActiveRecord::Base
  validates_presence_of :name, :avatar
  attr_accessible :address, :contact, :desc, :name, :company_id, :avatar, :pics_attributes

  has_many :work_relationships
  has_many :technicians, :through => :work_relationships, :uniq => true
  belongs_to :company
  
  has_many :pics, as: :picable
  accepts_nested_attributes_for :pics, allow_destroy: true, reject_if: :all_blank

  mount_uploader :avatar, AvatarUploader

end
