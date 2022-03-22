class NovelCreateForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :title, :string
  attribute :genre, :integer
  attribute :story_length, :integer
  attribute :image, :string
  attribute :release, :integer
  attribute :character_roles
  attribute :user_id, :integer
  attribute :novel_id, :integer

  #attributeがtextに対応していない為切り分け。実装されたら統一
  attr_accessor :plot, :genre, :story_length, :release, :character_texts

  #characterのバリデーション
  validates :character_texts, length: { maximum: 2000 }
  validates :character_roles, length: { maximum:20 }


  def to_model
    @novel
  end

  def save
    # 有効でない値の場合はこの時点でfalseを返す
    return false if invalid?

    # トランザクションを使用し、データを保存
    ActiveRecord::Base.transaction do
      novel = Novel.new(novel_params)
      novel.save!

      character_roles.each do |character_role|
        novel.characters.create!(character_role: character_role)
      end
      character_texts.each do |character_text|
        novel.characters.create!(character_text: character_text)
      end
    end
    # saveメソッドの返り値はboolean型を返すためtrueを明示
    true
  end

  def initialize(attributes = {}, novel: Novel.new)
    @novel = novel
    new_attributes = default_attributes.merge(attributes)
    super(new_attributes)
  end

  def update
    return false if invalid?

    ActiveRecord::Base.transaction do
      @novel.update!(novel_params)

      @novel.character_roles = character_roles
      @novel.character_texts = character_texts
    end
  end

  private

  def novel_params
    {
      title: title, genre: genre, story_length: story_length,
      plot: plot, image: image, release: release, user_id: user_id
    }
  end

  def default_attributes
    {
      title: @novel.title,
      genre: @novel.genre,
      story_length: @novel.story_length,
      plot: @novel.plot,
      image: @novel.image,
      release: @novel.release,
      user_id: @novel.user_id,
      character_roles: @novel.characters,
      character_texts: @novel.characters
    }
  end
end
