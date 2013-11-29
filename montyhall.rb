#On standard console input, you will be given a single integer ranging inclusively from 1 to 4,294,967,295 
#(unsigned 32-bit integer). This integer is the number of times you should simulate the game for both tactics. 
#Remember that a single "game simulation" is your program randomly placing a car behind one door and two goats 
#behind the two remaining doors. You must then randomly pick a door, have one of the two remaining doors open, 
#but only open if it's a goat behind said door! After that, if using the first tactic, you may open the picked door, 
#or if using the second tactic, you may open the other remaining door. Keep track if your success rates in both simulations.

class MontyHallGame
  
  CAR = 1
  GOAT = 2
  
  def initialize()
    @door_array = [CAR, GOAT, GOAT]
    @door_array.shuffle!
  end
  
  def run_game(tactic)  
    player_choose
    host_reveal
    return @player_door if tactic == 1
    return @door_array[0] if tactic == 2
  end
  private
  
  def player_choose
    @door_array.shuffle! #this shuffle may not need to be here?
    @player_door = @door_array.pop #choose random door
  end
  
  def host_reveal #reveal a door, must be a goat. Delete from the array.  
    if @door_array[0] == GOAT
      @door_array.shift
    elsif @door_array[1] == GOAT
      @door_array.pop
    else
      puts "ERROR"
    end
  end
  
  wins = 0
  
  runs = 1000000
  runs.times do
    game = MontyHallGame.new
    result = game.run_game(1)
    wins += 1 if result == CAR
  end
  
  puts "Total wins: #{wins} (#{wins.fdiv(runs)}%)"
  
  wins = 0
  runs.times do
     game = MontyHallGame.new
     result = game.run_game(2)
     wins += 1 if result == CAR
   end
   
  puts "Total wins: #{wins} (#{wins.fdiv(runs)}%)"

end
  
  

    

