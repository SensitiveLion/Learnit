class Search < ActiveRecord::Base
  belongs_to :course

  require "mechanize"

  def self.google(query)
    agent = Mechanize.new
    @google = agent.get('http://google.com/')
    google_form =  @google.form('f')
    google_form.q = query
    @google = agent.submit(google_form)
  end

  def self.bing(query)
    agent = Mechanize.new
    @bing = agent.get('https://bing.com/')
    bing_form = @bing.form()
    bing_form.q = query
    @bing = agent.submit(bing_form)
  end

  def self.yahoo(query)
    agent = Mechanize.new
    @yahoo = agent.get('https://search.yahoo.com/')
    yahoo_form = @yahoo.form('s')
    yahoo_form.p = query
    @yahoo = agent.submit(yahoo_form)
  end

  def self.ask(query)
    agent = Mechanize.new
    @ask = agent.get('http://www.ask.com/')
    ask_form = @ask.form()
    ask_form.q = query
    @ask = agent.submit(ask_form)
  end


  def self.aol(query)
    agent = Mechanize.new
    @aol = agent.get('http://search.aol.com/aol/webhome')
    aol_form = @aol.form('CSBsearchForm1')
    aol_form.q = query
    @aol = agent.submit(aol_form)
  end

  def self.wow(query)
    agent = Mechanize.new
    @wow = agent.get('http://www.wow.com/')
    wow_form = @wow.form('SearchBoxForm')
    wow_form.q = query
    @wow = agent.submit(wow_form)
  end
end
