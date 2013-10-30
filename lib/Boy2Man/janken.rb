module Boy2Man
  HANDS = ["グー", "チョキ", "パー"]

  def self.judge(a, b)
    case a
    when "グー"
      if b == "チョキ"
        return a
      elsif b == "パー"
        return b
      else
        return nil
      end
    when "チョキ"
      if b == "パー"
        return a
      elsif b == "グー"
        return b
      else
        return nil
      end
    when "パー"
      if b == "グー"
        return a
      elsif b == "チョキ"
        return b
      else
        return nil
      end
    end
  end
  
  # @!attribute [r] history
  # @return [Array] the history of player's hand
  class Janken
    attr_reader :history
    
    def initialize
      @history = Array.new
    end

    def history
      # retrun deep copy of history, to prevent history to be changed.
      Marshal.load(Marshal.dump(@history))
    end

    # @return [Array] resets history
    def reset
      @history.clear
    end

    # @return [String]
    def pon(hand)
      case hand
      when *HANDS
        # 先に手を決めておかないと後出しになる
        selected = case predict
        when "グー"   then "パー"
        when "チョキ" then "グー"
        when "パー"   then "チョキ"
        end
        @history.push hand
        selected
      else
      end
    end
    
    alias :hoi :pon
    alias :ぽん :pon
    alias :ほい :hoi

    private
    def predict
      possible_hands = Array.new

      if @history.length >= 3
        @history.each_with_index do |hand, i|
          # 最後に出されたと、その前の手から、次の手を予想する
          if hand == @history.last(2)[0] && @history[i+1] == @history.last
            possible_hands.push @history[i+2] if @history[i+2] != nil
          end
        end        
      end

      if possible_hands.empty? || (1 < @history.length && @history.length < 3)
        @history.each_with_index do |hand, i|
          # 最後に出された手から、次の手を予想する
          if hand == @history.last
            possible_hands.push @history[i+1] if @history[i+1] != nil
          end
        end        
      end

      possible_hands.empty? ? %w(グー チョキ パー).sample : possible_hands.sample
    end

  end
end