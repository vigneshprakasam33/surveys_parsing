class Participant < ActiveRecord::Base
  has_many :answers , :dependent => :destroy
  belongs_to :survey
end
