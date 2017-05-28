# -*- encoding : utf-8 -*-
class Group < ActiveRecord::Base
  belongs_to :user
  has_many :students, :dependent => :destroy
  has_many :assessments, :dependent => :destroy

  validates_presence_of :name

  def after_initialize
      @archive ||= false
  end

end
