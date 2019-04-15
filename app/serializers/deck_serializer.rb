class DeckSerializer < ActiveModel::Serializer
  attributes :id, :shuffled, :cards_count
  has_many :cards
end
