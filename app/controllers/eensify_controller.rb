class EensifyController < ApplicationController

  helper_method :base62_decode

  def show
    # convert input hash to db id
    dbId = base62_decode(params[:id])

    if dbId != "error"

      begin

        @url = Url.find(dbId)
        redirect_to @url.longUrl

      rescue ActiveRecord::RecordNotFound

        # did not find a match for this id
        render action: "error"

      end
    else

      # an invalid hash was submitted
      render action: "error"
    end
  end

  def create
    @url = Url.new(url_params)
    @url.save

    render action: "show"
  end

  def error
    render action: "error"
  end

  def base62_decode hash

    decodedString = 0;
    alphaNumericArray = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a

    # loop over array to get index of each symbol in hash
    hashChars = hash.chars
    hashLength = hashChars.length
    for value in hashChars

      index = alphaNumericArray.index(value)

      # if an invalid character has been included, break from loop
      if index.nil?
        decodedString = 'error'
        break
      end

      decodedString = index * 62 ** (hashLength - 1) + decodedString
      hashLength -= 1

    end

    return decodedString

  end

  private
  def url_params
    params.require(:urls).permit(:longUrl)
  end

end
