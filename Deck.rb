class Deck
  def initialize
    @deck = (1..52).to_a << 'A' << 'B'
    @keystream = Array.new
  end

  def generate_keystream(messagelength)
    i=0
    keystring = ''
    while i <= messagelength do
      deckindex = generate_card
      keystring << retrieve_letter(deckindex) if retrieve_letter(deckindex).instance_of? String
          if keystring.length == 5
            @keystream << keystring
            keystring = ''
          end
      i+=1
    end
    @keystream
  end

  def move_card (currentposition, newposition)
    @deck.insert(calculate_new_position(newposition), @deck.delete_at(currentposition))
  end

  def calculate_new_position(shift)
    shift > 53 ? shift-53 : shift
  end

  def generate_card
    move_card(@deck.index('A'),@deck.index('A')+1)

    move_card(@deck.index('B'),@deck.index('B')+2)

    perform_triple_cut

    perform_count_cut

    find_output_index
  end

  def retrieve_letter (index)
    if (@deck[index] != 'A' && @deck[index] != 'B')
      @deck[index] > 26 ? (64+@deck[index]-26).chr : (64+@deck[index]).chr
    end
  end

  def perform_triple_cut
    if (@deck.index('A') < @deck.index('B'))
      topcards = @deck.slice!(0..@deck.index('A')-1)
      bottomcards = @deck.slice!(@deck.index('B')+1..53)
    else
      topcards = @deck.slice!(0..@deck.index('B')-1)
      bottomcards = @deck.slice!(@deck.index('A')+1..53)
    end
    @deck.insert(0,bottomcards).flatten!
    @deck.insert(@deck.length,topcards).flatten!
  end

  def perform_count_cut
    @deck.insert(-2,@deck.slice!(0..@deck[-1].to_i-1)).flatten!
  end

  def find_output_index
    (@deck[0].instance_of? String) ? 53 : @deck[0].to_i
  end
end