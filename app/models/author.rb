# coding:utf-8

class Author
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name,            :type => String
  field :name_yomi,       :type => String
  field :birth_date,      :type => Date
  field :death_date,      :type => Date
  field :link,            :type => String
  field :consonant_index, :type => String
  field :sound_index,     :type => String

  has_many :books

  validates :name,
    :presence => {
      :message => '名前は必須です'
    },
    :uniqueness => {
      :message => 'その名前は既に登録されています'
    },
    :length => {
      :maximum => 140
    }
  validates :name_yomi,
    :format => {
      :with => Sound.yomi_regexp,
      :message => 'はひらがなのみで入力してください'
    },
    :length => {
      :maximum => 140
    }
  validates :link,
    :format => {
      :with => URI.regexp,
      :message => 'は URL を入力してください'
    },
    :length => {
      :maximum => 1000
    }

  {:name => '名前', :name_yomi => '名前読み'}.each do |k, v|
    validate k, :on => :update do
      errors.add(k, 'は変更できません') if send("#{k}_changed?")
    end
  end

  before_create :create_index

  def create_index
    self.consonant_index = Sound.create_consonant_index(self.name_yomi.first)
    self.sound_index = Sound.create_sound_index(self.name_yomi.first)
  end

end
