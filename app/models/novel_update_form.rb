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

  def update

  end
end
