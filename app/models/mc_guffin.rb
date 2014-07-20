# coding:utf-8

class McGuffin
  ITEM_ANBIGUOUS      = %w(もの 何か 謎 秘宝 宝物 お宝)
  ITEM_CODENAME       = %w(鷹)
  ITEM_CONTAINERS     = %w(壷 スーツケース アタッシュケース 財布
                           鞄 旅行鞄 スポーツバッグ ショルダーバッグ バックパック ナップサック リュックサック ハンドバッグ
                           袋 布袋 革袋 ゴミ袋 ビニール袋 コンビニのビニール袋 紙袋 麻袋
                           瓶 ボトル ペットボトル ワインボトル 水筒 魔法瓶 花瓶 タッパー ボンベ
                           缶 空き缶 コーラの空き缶
                           シャープペン ボールペン ペン 万年筆
                           箱 マッチ箱 段ボール箱
                           クッション ぬいぐるみ 人形 テディベア
                           仏像 キリスト像 マリア像 謎の像 土偶 石像)
  ITEM_WEAPONS        = %w(ピストル 銃 拳銃 マシンガン 猟銃 マグナム48 コルト・ガバメント
                           剣 刀 日本刀 青龍刀
                           ウラニウム ダイナマイト 爆薬 爆弾 手榴弾 時限爆弾 マシンガン 化学兵器 ウィルス)
  ITEM_ANIMALS        = %w(猫 子猫 犬 子犬 蛇 毒蛇 象 リス)
  ITEM_VALUABLES      = %w(指輪 首輪 ネックレス
                           札束 大金
                           宝石 ダイヤモンド 真珠 パール ルビー 絵 絵画)
  ITEM_DRUGS          = %w(麻薬 コカイン ヘロイン 覚醒剤 覚せい剤 大麻 ハッシーシ)
  ITEM_MAPS           = %w(地図 宝の地図 見取り図 研究所の見取り図 島の地図 城の地図 ガイドマップ)
  ITEM_MESSAGES       = %w(巻物 手紙 カセットテープ ビデオテープ ディスク フロッピーディスク CD MD CDプレイヤー ウォークマン ICチップ)
  ITEM_EVIDENCES      = %w(写真 証拠写真 ネガフィルム 設計図 書類)
  ITEM_KEYS           = %w(IDカード カードキー セキュリティカード 鍵 部屋の鍵)
  MODIFIER_CLICHE     = %w(伝説の 謎に包まれた 秘密の)
  MODIFIER_COLORS     = %w(赤い 青い 黒い 白い 黄色の 紫の 紫色の 茶色の 金色の 銀色の)
  MODIFIER_MATERIALS  = %w(ダイヤモンド製の 黄金の 木製の 漆塗りの ルビーの)
  MODIFIER_HISTORIES  = %w(が隠し持っていた に奪われた に盗まれた 盗まれた 消えた 失われた 忘れられた 形見の 極秘に入手した)
  ORGANIZATIONS       = %w(暴力団 マフィア 香港マフィア 中国マフィア
                           FBI CIA 警察 旧ソ連
                           シンジケート
                           ロシア政府 アメリカ政府 日本政府 中国政府 帝国政府)
  RELATION_CONTAINED  = %w(に詰めこまれた に詰められた に入った に格納されている に格納された に入っている に隠された に封じられた に厳重に保管された)

  def random(arr)
    arr[rand(arr.size)]
  end

  def item
   alts = [ITEM_DRUGS, ITEM_MAPS, ITEM_MESSAGES, ITEM_EVIDENCES, ITEM_KEYS]
   random(MODIFIER_COLORS) + random(ITEM_CONTAINERS) + random(RELATION_CONTAINED) + random(random(alts))
  end
end
