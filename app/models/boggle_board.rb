require 'set'

# Represents a boggle board - supports randomly generating a boggle board
# Question:  Is it appropriate to put PORO's in the /models folder?
class BoggleBoard
  attr_reader :tiles
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
  
  # static array of neighbors for recursive lookups of values
  # could also calculate this with code using x, y coordinates instead
  # or use direction such as N, NE, E, SE, S, etc.
  NEIGHBORS = [
    [1, 4, 5], #0
    [0, 2, 4, 5, 6], #1
    [1, 3, 5, 6, 7], #2
    [2, 6, 7], #3
    [0, 1, 5, 8, 9], #4
    [0, 1, 2, 4, 6, 8, 9, 10], #5
    [1, 2, 3, 5, 7, 9, 10, 11], #6
    [2, 3, 6, 10, 11], #7
    [4, 5, 9, 12, 13], #8
    [4, 5, 6, 8, 10, 12, 13, 14], #9
    [5, 6, 7, 9, 11, 13, 14, 15], #10
    [6, 7, 10, 14, 15], #11
    [8, 9, 13], #12
    [8, 9, 10, 12, 14], #13
    [9, 10, 11, 13, 15], #14
    [10, 11, 14], #15
  ]
  
  def initialize()
    # shuffle the dice positions
    shuffled_dice = DICE.shuffle

    # fill out a random die value from each of the shuffled
    @tiles = shuffled_dice.collect{|x| x.sample}
  end

  def search(word, board)
    if (word.length < 3)
      return false
    end

    # handle Qu special case
    @board = board.join.gsub("Qu", "Q").upcase
    uword = word.gsub("Qu", "Q").upcase

    #find the starting positions
    16.times do |x|
      if (@board[x] == uword[0])
        used_set = Set.new [x]
        found = traverse(x, used_set, uword[1..-1])
        if (found)
          return true
        end
      end
    end
    return false
  end

  #traverse the neighbors looking for a match
  def traverse(pos, used_set, uword)
    NEIGHBORS[pos].each do |i|
      if (uword[0] == @board[i] && !used_set.include?(i))
        if (uword.length == 1)
          return true
        else
          used_set.add(i)
          return traverse(i, used_set, uword[1..-1])
        end
      end
    end
  end
  
end