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

  delegate :persisted?, to: :@novel

  #characterのバリデーション
  validates :character_text, length: { maximum: 2000 }
  validates :character_role, length: { maximum:20 }


#  def to_model
#    @novel
#  end

#  def initialize(attributes = {}, novel: Novel.new)
#    @novel = novel
#    new_attributes = default_attributes.merge(attributes)
#    super(new_attributes)
#  end

#  def update
#    return false if invalid?

#    ActiveRecord::Base.transaction do
#      @novel.update!(novel_params)

#      @novel.character_role = character_role
#      @novel.character_text = character_text
#    end
#  end

#  private

#  def novel_params
#    {
#      title: title, genre: genre, story_length: story_length,
#      plot: plot, image: image, release: release, user_id: user_id
#    }
#  end

#  def default_attributes
#    {
#      title: @novel.title,
#      genre: @novel.genre,
#      story_length: @novel.story_length,
#      plot: @novel.plot,
#      image: @novel.image,
#      release: @novel.release,
#      user_id: @novel.user_id,
#      character_role: @novel.character,
#      character_text: @novel.character
#    }
#  end
end
