class PagesController < ApplicationController
  def hello
  end

  def sum
    @params = params['numbers'].scan(/\d+\.\d+|\d+/)
    sum = 0
    array = []
    @params.each do |number|
      sum += number.to_f
    end
    sum = sum.round(2)
    # render json: sum #.round(2) # Remove for initial test
    render json: sum
# TODO LOGGER
    
  end

  def reverse_words
    sentence = params['sentence']
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
    new_sentence += word
    # render json: sentence
    render json: new_sentence
  end
end
