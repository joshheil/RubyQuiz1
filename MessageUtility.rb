class MessageUtility
  def convert_message_to_numeric_array (message)
    result = Array.new
    message.each do |characterset|
      temparray = Array.new
      characterset.split(//).each do |character|
        temparray << (character).ord-64
      end
      result << temparray
    end
    result
  end

  def combine_numeric_array (message, keystream)
    result = Array.new
    i = 0
    while i < message.length
      while i < keystream.length
        internalarray = Array.new
        j = 0
        while j < message[i].length
          sum = message[i][j] + keystream[i][j]
          internalarray << ((sum > 26) ? sum-26 : sum)
          j+=1
        end
        result.push(internalarray)
        i+=1
      end
    end
    result
  end

  def combine_numeric_array_for_decode(message,keystream)
    result = Array.new
    i = 0
    while i < message.length
      while i < keystream.length
        internalarray = Array.new
        j = 0
        while j < message[i].length
          if message[i][j] <=keystream[i][j]
            difference = (26 + message[i][j]) - keystream[i][j]
          else
            difference = message[i][j] - keystream[i][j]
          end

          internalarray.push(difference)
          j+=1
        end
        result.push(internalarray)
        i+=1
      end
    end
    result
  end

  def convert_numeric_array_to_message (numericarray)
    result = Array.new
    numericarray.each do |numericset|
      temparray = Array.new
      numericset.each do |numericvalue|
        temparray << (numericvalue+64).chr
      end
      result << temparray
    end
    finalresult = Array.new
    result.each do |item|
      finalresult << item.join
    end
    finalresult
  end

  def format_message(message)
    result = message.upcase.gsub(/\W+/,"").scan(/.{1,5}/)
    (5 - result[result.length-1].length).times do
      result[result.length-1] += 'X'
    end
    result
  end
end