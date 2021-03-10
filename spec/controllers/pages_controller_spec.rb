require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  let(:valid_numbers) do
    {
      numbers: "1,2,3",
      numbers: "2,3,3.0"
    }
  end

  let(:invalid_numbers) do
    { numbers: "1,2,a",
  }
  end

  let(:valid_sentence) do
    {
      sentence: "oct0pus",
      sentence: "supotco si taerg",
      sentence: "I ma supotcO!",
      sentence: "..supotco#!si taerg.",
    }
  end

  let(:oct0pus_sentence) do
    { sentence: "oct0pus",
  }
  end

  describe "GET Hello page" do
    it "returns blank body and 204 HTTP response" do
    get :hello
      expect(response).to have_http_status(204)
    end
  end

  describe "GET Sum" do
    it "return 200(ok) HTTP status with valid numbers" do
      get :sum, :params => valid_numbers
      expect(response).to have_http_status(200)
    end

    it "return 400(ok) HTTP status with invalid params" do
      get :sum, :params => invalid_numbers
      expect(response).to have_http_status(400)
    end

    it "return 3 from 1,2" do
      get :sum, :params => {numbers: "1,2"}
      expect(response.body).to eq("3")
    end

    it "return -3 from -1,-2" do
      get :sum, :params => {numbers: "-1,-2"}
      expect(response.body).to eq("-3")
    end
  end

  describe "GET reverse-words" do
    it "return 200(ok) HTTP status with valid string" do
      get :reverse_words, :params => valid_sentence
      expect(response).to have_http_status(200)
    end
    
    it "return supotco from octopus" do
      get :reverse_words, :params => {sentence: "octopus"}
      expect(response.body).to eq("supotco")
    end

    it "return supotco si taerg from octopus is great" do
      get :reverse_words, :params => {sentence: "octopus is great"}
      expect(response.body).to eq("supotco si taerg")
    end

    it "return tco0sup from oct0pus" do
      get :reverse_words, :params => {sentence: "oct0pus"}
      expect(response.body).to eq("tco0sup")
    end
    
    it "return ..supotco#!si taerg. from ..octopus#!is great." do
      get :reverse_words, :params => {sentence: "..octopus#!is great."}
      expect(response.body).to eq("..supotco#!si taerg.")
    end

    it "return I ma supotcO! from I am Octopus!" do
      get :reverse_words, :params => {sentence: "I am Octopus!"}
      expect(response.body).to eq("I ma supotcO!")
    end
  end
end
