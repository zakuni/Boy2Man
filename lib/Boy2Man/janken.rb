module Boy2Man
  HANDS = ["グー", "チョキ", "パー"]
  
  # @!attribute [r] history
  #   @return [Array] the history of player's hand
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
    def match(hand)
      case hand
      when *HANDS
        # 先に手を決めておかないと後出しになる
        selected = select_hand
        @history.push hand
        case judge(hand, selected)
        when hand
          "win"
        when selected
          "lose"
        else
          "draw"
        end
      else
      end
    end
    
    # @return [String]
    def select_hand
      case predict
      when "グー"   then "パー"
      when "チョキ" then "グー"
      when "パー"   then "チョキ"
      end
    end

    private
    def predict
      @history.empty? ? %w(グー チョキ パー).sample : @history.sample
    end

    def judge(a, b)
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

  end
end