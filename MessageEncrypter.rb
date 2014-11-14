require_relative 'MessageUtility'
require_relative 'Deck'

class MessageEncrypter
  def encrypt_message (message)
    messageutility = MessageUtility.new
    deck = Deck.new

    formattedmessage = messageutility.format_message(message)

    keystream = deck.generate_keystream(formattedmessage.length*5)

    messagenumericarray = messageutility.convert_message_to_numeric_array(formattedmessage)

    keystreamnumericarray = messageutility.convert_message_to_numeric_array(keystream)

    combinednumericmessage = messageutility.combine_numeric_array(messagenumericarray, keystreamnumericarray)

    encryptedresult = messageutility.convert_numeric_array_to_message(combinednumericmessage)
  end


end
