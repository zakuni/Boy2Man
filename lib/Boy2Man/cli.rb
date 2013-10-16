module Boy2Man

  def self.play
    stand = Boy2Man.new
    loop do
      print '> '
      hand = gets.chomp
      case hand
      when "", "bye", "exit"
        exit
      when *HANDS
        result = stand.match(hand)
        if result == "win"
          puts hand + "\nYou Win!"
        elsif result == "lose"
          puts hand + "\nYou Lose!"
        else
          puts hand + "\nDraw!"
      when "history"
        puts stand.history
      when "reset"
        stand.reset
      else
        puts stand.select_hand
      end
    end
  end

end