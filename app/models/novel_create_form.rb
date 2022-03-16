class NovelCreateForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :title, :string
  attribute :genre, :integer
  attribute :story_length, :integer
  attribute :image, :string
  attribute :release, :integer
  attribute :character_role, :string
  attribute :user_id, :integer
  attribute :novel_id, :integer

  #attributeがtextに対応していない為切り分け。実装されたら統一
  attr_accessor :plot, :genre, :story_length, :release, :character_text

  #characterのバリデーション
  validates :character_text, length: { maximum: 2000 }
  validates :character_role, length: { maximum:20 }



  def save
    return false unless valid?
    novel = Novel.new(title: title, genre: genre, story_length: story_length, plot: plot, image: image, release: release, user_id: user_id)
    novel.save
    character = Character.new(character_role: character_role, character_text: character_text, novel_id: novel.id)
    character.save!
  end
end
