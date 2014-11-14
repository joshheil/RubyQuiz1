require_relative 'Deck'
require_relative 'MessageUtility'

class MessageDecrypter
  def decrypt_message(message)
    message = message.split(' ')

    messageutility = MessageUtility.new
    deck = Deck.new

    keystream = deck.generate_keystream(message.length*5)

    numericarray = messageutility.convert_message_to_numeric_array(message)

    numerickeystream = messageutility.convert_message_to_numeric_array(keystream)

    numericresult = messageutility.combine_numeric_array_for_decode(numericarray,numerickeystream)

    messageutility.convert_numeric_array_to_message(numericresult)
  end
end
