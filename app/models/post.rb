class Post < ActiveRecord::Base
  validates :airport, presence:true
  #validates :terminal, presence:true
  #validates :location, presence:true
  #validates :purpose, presence:true
  #validates :company, presence:true
  #validates :destination, presence:true
  #validates :flightdate, presence:true
  #validates :flighttime, presence:true
  #validates :latestcomment, presence:true
end
