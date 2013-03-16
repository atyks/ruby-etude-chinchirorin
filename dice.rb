# -*- mode:ruby; coding:utf-8 -*-

# ランダムで 1～6までを表示する

class Dice
  attr_accessor :pip
  attr_accessor :record
  attr_accessor :count
  # コンストラクタ
  # num : サイコロの目の数
  def initialize(num=6)
    # サイコロの目の数
    @pip = num.to_i < 1? 6: num.to_i

    # サイコロの目の出現回数を記録する
    @record = {}
    @record.default = 0

    # サイコロの振った回数を記録する
    @count = 0

  end

  # サイコロを振る
  #  出た目と振った回数を記録しておく
  def roll()
    v = rand( @pip ) + 1

    @record[v] += 1
    @count += 1
    return(v)
  end

  # 出た目の出現頻度を求める
  # 返り値は、実数
  def getAvarage()
    avarage = {}

    @record.each do | key, value |
      avarage[key] = value.to_f / @count.to_f

    end

    return avarage
  end

end

