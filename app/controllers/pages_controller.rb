class PagesController < ApplicationController
  def hello
  end

  # sum - non refactored
    # def sum
    #   Log.create(content: params['numbers'])
    #   @params = number_params.split(",")
    #   sum = 0
    #   @params.each do |number|
    #     sum += number.to_i
    #     return render status: 400 if number.match?(/[^\d+|\-]/)
    #   end
    #       sum = sum.to_i
    #       render json: sum
    # end
      
  def sum
    return render status: 400 if number_params.match?(/[^\d+\.\d+|\d+|\-|\,]/)
    numbers_array = number_params.split(",").map(&:to_f)
    result = numbers_array.sum.to_i

    render json: result
  end
  # sum buffer
    #   numbers_array = number_params.scan(/\d+\.\d+|\d+/)
    #   Log.create(content: params['numbers'])
    #   # Log.create(content: @params)
    #   sum = 0
    #   array = []
    #   numbers_array.each do |number|
    #     sum += number.to_f
    #   end
    #   sum = sum.round(2)
    #   render json: sum
  
  def reverse_words
    # sentence = params['sentence']
    sentence = sentence_params

    # sentence_array = sentence.split(/\b/)
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

    render json: new_sentence
  end

  private

  def number_params
    params.require('numbers')
  end


  def sentence_params
    params.require('sentence')
  end

end
