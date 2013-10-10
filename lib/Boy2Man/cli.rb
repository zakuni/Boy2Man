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
        puts stand.match(hand)
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