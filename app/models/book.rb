# coding:utf-8

class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title,           :type => String
  field :title_yomi,      :type => String
  field :author_id,       :type => String
  field :body,            :type => String
  field :creator,         :type => String
  field :updater,         :type => String
  field :consonant_index, :type => String
  field :sound_index,     :type => String

  validates :title,
    :presence => {
      :message => 'タイトルは必須です'
    },
    :uniqueness => {
      :message => 'その名前は既に登録されています'
    },
    :length => {
      :maximum => 140
    }
  validates :title_yomi,
    :format => {
      :with => Sound.yomi_regexp,
      :message => 'はひらがなのみで入力してください'
    }
  validates :body,
    :presence => {
      :message => '本文は必須です'
    },
    :length => {
      :maximum => 100000
    } 

  {:title => 'タイトル', :title_yomi => '読み(ひらがな)'}.each do |k, v|
    validate k, :on => :update do
      errors.add(k, 'は変更できません') if send("#{k}_changed?")
    end
  end

  belongs_to :author

  before_create :create_index

  def create_index
    self.consonant_index = Sound.create_consonant_index(self.title_yomi.first)
    self.sound_index = Sound.create_sound_index(self.title_yomi.first)
  end
end
