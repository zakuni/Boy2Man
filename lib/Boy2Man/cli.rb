module Boy2Man

  def self.play
    janken = Janken.new
    loop do
      print '> '
      hand = gets.chomp
      case hand
      when "", "bye", "exit"
        exit
      when *HANDS
        puts opponent = janken.pon(hand)

        winner = Boy2Man.judge(hand, opponent)
        if winner == hand
          puts "You Win!"
        elsif winner == opponent
          puts "You Lose!"
        else
          puts "Draw!"
        end
      when "history"
        puts janken.history
      when "reset"
        janken.reset
      else
        puts janken.select_hand
      end
    end
  end

end