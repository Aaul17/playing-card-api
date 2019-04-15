class CardSerializer < ActiveModel::Serializer
  attributes :id, :suit, :value
  belongs_to :deck
end
