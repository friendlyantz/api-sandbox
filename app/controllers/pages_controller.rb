class PagesController < ApplicationController
  def hello
  end

  def sum
    # @params = params['numbers'].split(",")
    @params = params['numbers'].scan(/\d+\.\d+|\d+/)
    sum = 0
    array = []
    @params.each do |number|
      sum += number.to_f
      array.push(number)
    end
    render json: sum #.round(2) # Remove for initial test
    # render json: array

    
  end

  def reverse_words
    @params = params['sentence']
    @params.reverse!
    render json: @params
  end
end
