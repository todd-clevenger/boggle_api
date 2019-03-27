# Represents a boggle board - supports randomly generating a boggle board
# Question:  Is it appropriate to put PORO's in the /models foler?  For now, seems appropirate.  Could move to /libs, but
# currently using BoggleBoard public attributes to generate the REST contract.
class BoggleBoard
  # declare DICE constant and initialize it with letters
  # dice letters taken from:
  # https://boardgames.stackexchange.com/questions/29264/boggle-what-is-the-dice-configuration-for-boggle-in-various-languages
  DICE = [
    %w[R I F O B X],
    %w[I F E H E Y],
    %w[D E N O W S],
    %w[U T O K N D],
    %w[H M S R A O],
    %w[L U P E T S],
    %w[A C I T O A],
    %w[Y L G K U E],
    %w[Qu B M J O A],
    %w[E H I S P N],
    %w[V E T I G N],
    %w[B A L I Y T],
    %w[E Z A V N D],
    %w[R A L E S C],
    %w[U W I L R G],
    %w[P A C E M D],
  ]
  
  attr_reader :tiles
  
  def initialize()
    # shuffle the dice positions
    shuffled_dice = DICE.shuffle

    # fill out a random die value from each of the shuffled
    @tiles = shuffled_dice.collect{|x| x.sample}
  end
  
end