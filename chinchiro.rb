# -*- mode:ruby; coding:utf-8 -*-
require './dice.rb'

class Chinchiro

  attr_accessor :history
  attr_accessor :last_basket
  attr_accessor :results
  # コンストラクタ
  def initialize()
    # サイコロのインスタンスを準備する
    @dice = Dice.new();
  end

  def throwDice()
    basket = [];

    # 3回続けてサイコロを振る。
    3.times do
      basket.push(@dice.roll())
    end

    return(basket);
  end

  def game()
    @results = nil
    @history = []

    3.times do
      # サイコロを振る
      basket = self.throwDice().sort

      # サイコロを振った結果を保存する
      @history.push(basket)
      @last_basket = basket

      # 役を判定する
      results = self.checkHand(basket)

      if(results != nil) then
        @results = results

        break;
      end
    end

    @results = "目無し" if results == nil

    return(results)

  end

  # 手役を判定する
  def checkHand(basket)
    results = nil

    results = "ピンゾロ" if ! results && self.checkPinzoro(basket)

    if ! results && self.checkArashi(basket) then
      results = sprintf("アラシ-%d", self.checkArashi(basket))
    end

    results = "ジゴロ" if ! results && self.checkJigoro(basket)

    results = "ヒフミ" if ! results && self.checkHihumi(basket)

    results = "出目-1" if ! results && self.checkIchinome(basket)

    results = "出目-6" if ! results && self.checkRokunome(basket)

    if ! results && self.checkSonotame(basket) then
      results = sprintf("出目-%d", self.checkSonotame(basket))
    end

    return(results)
  end

  def checkPinzoro(basket)
    ret = false;

    if  checkArashi(basket) == 1 then
      ret = true
    end

    return(ret)
  end

  def checkJigoro(basket)
    ret = false;

    if basket == [4,5,6] then
      ret = true
    end

    return(ret)
  end

  def checkHihumi(basket)
    ret = false;

    if basket == [1,2,3] then
      ret = true
    end

    return(ret)
  end

  def checkIchinome(basket)
    ret = false;

    ret = true if self.checkMe(basket) == 1

    return(ret)
  end

  def checkRokunome(basket)
    ret = false;
    ret = true if self.checkMe(basket) == 6

    return(ret)
  end

  def checkSonotame(basket)
    ret = false;

    me  = self.checkMe(basket)

    ret = me if me

    return(ret)
  end

  def checkMe(basket)
    ret = nil

    tmp = {}
    tmp.default = 0;

    basket.each do | i |
      tmp[i] += 1

    end

    tmp.each do | key, val |
      ret = key if(tmp.length == 2 && val == 1)
    end

    return(ret)
  end

  def checkArashi(basket)
    ret = false;
    me = nil

    (1 .. 6).each do | i |

      if basket == [i, i, i] then
        ret = true
        me = i
      end

    end

    return(me)

  end

end
