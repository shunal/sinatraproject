class InstrumentsController < ApplicationController

  get "/instruments" do
    erb :"/instruments/index.html"
  end

  get "/instruments/new" do
    erb :"/instruments/new.html"
  end

  post "/instruments" do
    redirect "/instruments"
  end

  get "/instruments/:id" do
    @instrument = Instrument.find(params[:id])
    erb :"/instruments/show.html"
  end

  get "/instruments/:id/edit" do
    @instrument = Instrument.find(params[:id])
    erb :"/instruments/edit.html"
  end

  patch "/instruments/:id" do
    @instrument = Instrument.find(params[:id])
    @instrument.instrument_type = params[:instrument_type]
    @instrument.save
    redirect "/users/#{@instrument.user_id}"
  end

  delete "/instruments/:id/delete" do
    @instrument = Instrument.find(params[:id])
    @instrument.delete
    redirect "/users/#{@instrument.user_id}"
  end
end
