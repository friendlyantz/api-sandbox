require "rails_helper"

if defined?(PagesController)

  RSpec.describe PagesController, :type => :routing do
    describe "routing" do

      it "routes to #hello" do
        expect(:get => "/hello").to route_to("pages#hello")
      end

      it "routes to number #sum" do
        expect(:get => "/sum").to route_to("pages#sum")
      end

      it "routes to Octopus #reverse-words" do
        expect(:get => "/reverse-words").to route_to("pages#reverse_words")
      end

    end
  end

end