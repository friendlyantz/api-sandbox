class PagesController < ApplicationController

  def hello
  end

  def sum
    Log.create(content: params['numbers'])
    @params = number_params.split(",")
    # validates params['numbers'], format: { with: /\d+|\,/,  message: "only allows numbers" }
    sum = 0
    @params.each do |number|
      sum += number.to_i
      return render status: 400 if number.match?(/[^\d+]/)
    end
    sum = sum.to_i
    render json: sum
  
  end

  # def sum
  #   # @params = params['numbers'].scan(/\d+\.\d+|\d+/)
  #   @params = number_params.scan(/\d+\.\d+|\d+/)
  #   Log.create(content: params['numbers'])
  #   # Log.create(content: @params)
  #   sum = 0
  #   array = []
  #   @params.each do |number|
  #     sum += number.to_f
  #   end
  #   sum = sum.round(2)
  #   # render json: sum #.round(2) # Remove for initial test
  #   render json: sum
  
  # end

  def reverse_words
    sentence = params['sentence']
    # sentence = sentence_params
    # Log.create(content: paramsg['sentence'])
    new_sentence = ""
    word = ""
    sentence.each_char do |char|
      if char.match?(/[a-zA-Z]/)
        word += char
      else
        new_sentence += word.reverse! + char
        word = ""
      end 
    end
    new_sentence += word.reverse!
    # render json: sentence
    render json: new_sentence
  end

  private

  def number_params
    params.require('numbers')
  end


  def sentence_params
    params.require('sentence')#.permit(/\d+\.\d+|\d+/)
  end

end
