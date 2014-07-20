# coding:utf-8
class Sound
  SOUNDS = [
    ['あ', 'い', 'う', 'え', 'お', 'ぁ', 'ぃ', 'ぅ', 'ぇ', 'ぉ'],
    ['か', 'き', 'く', 'け', 'こ', 'が', 'ぎ', 'ぐ', 'げ', 'ご'],
    ['さ', 'し', 'す', 'せ', 'そ', 'ざ', 'じ', 'ず', 'ぜ', 'ぞ'],
    ['た', 'ち', 'つ', 'て', 'と', 'だ', 'ぢ', 'づ', 'で', 'ど', nil,  nil,  'っ', nil,  nil],
    ['な', 'に', 'ぬ', 'ね', 'の'],
    ['は', 'ひ', 'ふ', 'へ', 'ほ', 'ば', 'び', 'ぶ', 'べ', 'ぼ', 'ぱ', 'ぴ', 'ぷ', 'ぺ', 'ぽ'],
    ['ま', 'み', 'む', 'め', 'も'],
    ['や', nil,  'ゆ', nil,  'よ', 'ゃ', nil,  'ゅ', nil,  'ょ'],
    ['ら', 'り', 'る', 'れ', 'ろ'],
    ['わ', nil,  'を', nil,  'ん']
  ]
  CONSONANTS = SOUNDS.map {|sounds| sounds.first }

  def self.get_sounds_by_consonant(consonant)
    sounds = SOUNDS.find(consonant) do |sounds|
      sounds.first == consonant
    end
    sounds[0, 5].compact
  end

  # 音のインデクスを作成する (「ぎ」は「き」)
  def self.create_sound_index(sound)
    sounds = SOUNDS.find do |sounds|
      sounds.include?(sound)
    end
    sounds[sounds.index(sound) % 5]  
  end

  # 子音のインデクスを作成する (「ぎ」「き」は「か」)
  def self.create_consonant_index(sound)
    sounds = SOUNDS.find do |sounds|
      sounds.include?(sound)
    end
    sounds.first
  end

  # 読みのバリデーションを行う
  def self.yomi_regexp
    /^(#{SOUNDS.flatten.compact.join('|')})+$/
  end
end
