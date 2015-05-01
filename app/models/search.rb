class Search < ActiveRecord::Base
  belongs_to :course

  require "mechanize"


  def self.google(query)
    @google_links = Hash.new
    agent = Mechanize.new
    @google = agent.get('http://google.com/')
    google_form =  @google.form('f')
    google_form.q = query
    @google = agent.submit(google_form)
    @google.links.each do |link|
      url1 = link.href.gsub(/.url\?q\=/,"" )
      url2 = url1.gsub(/&sa=U&ei=(.*)/,"" )
      url3 = url2.gsub(/^(?!http(.*)$).*/,"" )
      url4 = url3.gsub(/.search?(.*)/,"" )
      url5 = url4.gsub(/(.*)google.com(.*)/,"" )
      url = url5.gsub(/(.*)webcache.(.*)/,"" )
      if url.length != 0 && link.text.strip.length != 0
        @google_links[link.text] = url
      end
    end
  end

  def self.bing(query)
    @bink_links = Hash.new
    agent = Mechanize.new
    @bing = agent.get('https://bing.com/')
    bing_form = @bing.form()
    bing_form.q = query
    @bing = agent.submit(bing_form)
    @bing.links.each do |link|
      if link.href != nil && link.text != nil
        url1 = link.href.gsub(/^(?!http(.*)$).*/,"")
        url2 = url1.gsub(/(.*)microsoft.com(.*)/,"")
        url = url2.gsub(/(.*)freebase.com(.*)/,"")
        url = url2.gsub(/(.*)twitter.com(.*)/,"")
        text1 = link.text.gsub(/en.wikipedia.org(.*)/,"")
        text2 = text1.gsub(/Freebase/,"")
        text3 = text2.gsub(/(.*)bit.ly(.*)/,"")
        text4 = text3.gsub(/^Wikipedia/,"")
        text = text4.gsub(/^More on Wikipedia/,"")
        if url.length != 0 && text.strip.length != 0
          @bing_links[link.text] = url
        end
      end
    end
  end

  def self.yahoo(query)
    @yahoo_links = Hash.new
    agent = Mechanize.new
    @yahoo = agent.get('https://search.yahoo.com/')
    yahoo_form = @yahoo.form('s')
    yahoo_form.p = query
    @yahoo = agent.submit(yahoo_form)
    @yahoo.links.each do |link|
      if link.href != nil && link.text != nil
        url1 = link.href.gsub(/(.*)yahoo(.*)/,"")
        url2 = url1.gsub(/(.*)flickr.com(.*)/,"")
        url3 = url2.gsub(/javascript(.*)/,"")
        url = url3.gsub(/(.*)cache.aspx(.*)/,"")
        if url.length != 0 && link.text.strip.length != 0
          @yahoo_links[link.text] = url
        end
      end
    end
  end
  def self.ask(query)
    @ask_links = Hash.new
    agent = Mechanize.new
    @ask = agent.get('http://www.ask.com/')
    ask_form = @ask.form()
    ask_form.q = query
    @ask = agent.submit(ask_form)
    @ask.links.each do |link|
      if link.href != nil && link.text != nil
        url1 = link.href.gsub(/(.*)ask.com(.*)/,"")
        url2 = url1.gsub(/(.*)answers.yahoo(.*)/,"")
        url3 = url2.gsub(/javascript(.*)/,"")
        url = url3.gsub(/(.*)freebase.com(.*)/,"")
        text1 = link.text.gsub(/(.*)More »(.*)/,"")
        text2 = text1.gsub(/(.*)Mobile Site(.*)/,"")
        text3 = text2.gsub(/Source/,"")
        text4 = text3.gsub(/(.*)IMDb(.*)/,"")
        text = text4.gsub(/More>>/,"")
        if url.length != 0 && text.strip.length != 0
          @ask_links[link.text] = url
        end
      end
    end
  end


  def self.aol(query)
    @aol_links = Hash.new
    agent = Mechanize.new
    @aol = agent.get('http://search.aol.com/aol/webhome')
    aol_form = @aol.form('CSBsearchForm1')
    aol_form.q = query
    @aol = agent.submit(aol_form)
    @aol.links.each do |link|
      if link.href != nil && link.text != nil
        url1 = link.href.gsub(/(.*)aol(.*)/,"")
        url2 = url1.gsub(/(.*)google.com(.*)/,"")
        url3 = url2.gsub(/(.*)search?(.*)/,"")
        url4 = url3.gsub(/(.*)about?(.*)/,"")
        url5 = url4.gsub(/javascript(.*)/,"")
        url6 = url5.gsub(/^(?!http(.*)$).*/,"")
        url = url6.gsub(/(.*)freebase.com(.*)/,"")
        text1 = link.text.gsub(/(.*)More&gt;&gt;(.*)/,"")
        text2 = text1.gsub(/Data from: Freebase/,"")
        text = text2.gsub(/(.*)Mobile Site(.*)/,"")
        if url.length != 0 && text.strip.length != 0
          @aol_links[link.text] = url
        end
      end
    end
  end

  def self.wow(query)
    @wow_links = Hash.new
    agent = Mechanize.new
    @wow = agent.get('http://www.wow.com/')
    wow_form = @wow.form('SearchBoxForm')
    wow_form.q = query
    @wow = agent.submit(wow_form)
    @wow.links.each do |link|
      if link.href != nil && link.text != nil
        url1 = link.href.gsub(/(.*)wow.com(.*)/,"")
        url2 = url1.gsub(/(.*)wow.nextag.com(.*)/,"")
        url3 = url2.gsub(/^(?!http(.*)$).*/,"")
        url4 = url3.gsub(/(.*)aol.com(.*)/,"")
        url = url4.gsub(/(.*)freebase.com(.*)/,"")
        text = link.text
        if url.length != 0 && text.strip.length != 0
          @wow_links[link.text] = url
        end
      end
    end
  end
end
