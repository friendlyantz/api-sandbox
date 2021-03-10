class PagesController < ApplicationController
  def hello
  end

  def sum
    return render status: 400 if number_params.match?(/[^\d+\.\d+|\d+|\-|\,]/)
    numbers_array = number_params.split(",").map(&:to_i)
    result = numbers_array.sum

    render json: result
  end
  
  def reverse_words
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
