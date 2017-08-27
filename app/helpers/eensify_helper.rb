module EensifyHelper

  def eensy_url url
     if url

       # convert URL id to hash by base-62 encoding it
       hash = base62_encode(url.id)

       eensyUrl = Rails.application.config.eensify_url + hash
     else
       eensyUrl = 'OOPS! Request failed.'
     end
  end

  def base62_encode num

    encodedNum = ''
    alphaNumericArray = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a

    while num > 0 do

      remainder = num % 62
      encodedNum = alphaNumericArray[remainder] + encodedNum
      num = num / 62

    end

    return encodedNum

  end

end
