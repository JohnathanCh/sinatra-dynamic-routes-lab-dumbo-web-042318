require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    name = params[:name]
    @name = name.reverse
    @name
  end

  get '/square/:number' do
    # Rack::Response.new.status = 200
    number = params[:number]
    @number = number.to_i ** 2
    "<p> #{@number}</p>"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    phrase = params[:phrase].split("%20")
    @phrase = phrase.join(" ")
    # binding.pry
      # @number.times do
      #   @phrase
      # end
    erb :say_number_phrase
    # @phrase * @number
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @word1 = params[:word1]
    @word2 = params[:word2]
    @word3 = params[:word3]
    @word4 = params[:word4]
    @word5 = params[:word5]

    @word1 + " " + @word2 + " " + @word3 + " " + @word4 + " " + @word5 + "."
    # "<p>#{@word1} #{@word2} #{@word3} #{@word4} #{@word5}</p>"
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i

    case @operation
      when "add"
        "#{@number1 + @number2}"
      when "subtract"
        "#{@number1 - @number2}"
      when "multiply"
        "#{@number1 * @number2}"
      when "divide"
        "#{@number1 / @number2}"
    end

    # @solution = eval"#{@number1} #{@operation} #{@number2}"
    # @solution
  end

end
