class Episode
  include Mongoid::Document
  field :number, type: Float
  field :title, type: String
  field :directed_by, type: String
  field :first_aired, type: Time

  validates :number, uniqueness: true, presence: true
end
