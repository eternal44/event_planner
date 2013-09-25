class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :place, :time, :event_title
  has_many :users, :through => :guest_lists

  validates :date, 		:presence 	=> true,
  						:length 	=> { minimum: 5 }
  validates :place, 	:presence 	=> true,
  						:length 	=> { minimum: 5 }
  validates :time, 		:presence 	=> true,
  				   		:length 	=> { minimum: 5 }
  validates :event_title, :presence 	=> true,
  				   		:length 	=> { minimum: 5 }  				   		
end
