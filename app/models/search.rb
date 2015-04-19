class Save
  def google(query)
    agent = Mechanize.new
    @google = agent.get('http://google.com/')
    google_form = page.form('f')
    google_form.q = search
    @google = agent.submit(google_form)
  end

  def google_parse
    @google.links.each do |link|
      url = link.href.gsub(/.url\?q\=/,"" )
      url = url.gsub(/&sa=U&ei=(.*)/,"" )
      url = url.gsub(/.search?(.*)/,"" )
      url = url.gsub(/(.*)google.com(.*)/,"" )
      url = url.gsub(/(.*)webcache.(.*)/,"" )
      @google_link = url
      @google_text = link.text
    end
  end

  def bing(query)
    agent = Mechanize.new
    @bing = agent.get('https://bing.com/')
    bing_form = page.form()
    bing_form.q = 'ruby mechanize'
    @bing = agent.submit(bing_form)
  end

  def bing_parse
    @bing.links.each do |link|
      if link.href != nil && link.text != nil
        url = link.href.gsub(/^(?!http(.*)$).*/,"")
        url = url.gsub(/(.*)microsoft.com(.*)/,"")
        @bing_link = url
        @bing_text = link.text
      end
    end
  end

  def yahoo(query)
    agent = Mechanize.new
    @yahoo = agent.get('https://search.yahoo.com/')
    yahoo_form = page.form('s')
    yahoo_form.p = 'ruby mechanize'
    @yahoo = agent.submit(bing_form)
  end

  def yahoo_parse
    @yahoo.links.each do |link|
      if link.href != nil && link.text != nil
        url = link.href.gsub(/(.*)yahoo(.*)/,"")
        url = url.gsub(/(.*)flickr.com(.*)/,"")
        url = url.gsub(/javascript(.*)/,"")
        url = url.gsub(/(.*)cache.aspx(.*)/,"")
        @yahoo_link = url
        @yahoo_text = link.text
      end
    end
  end

  def ask(query)
    agent = Mechanize.new
    @ask = agent.get('http://www.ask.com/')
    ask_form = page.form()
    ask_form.q = 'ruby mechanize'
    @ask = agent.submit(bing_form)
  end

  def ask_parse
    @ask.links.each do |link|
      if link.href != nil && link.text != nil
        url = link.href.gsub(/(.*)ask.com(.*)/,"")
        url = url.gsub(/(.*)answers.yahoo(.*)/,"")
        url = url.gsub(/javascript(.*)/,"")
        text = link.text.gsub(/(.*)More »(.*)/,"")
        text = text.gsub(/(.*)Mobile Site(.*)/,"")
        @ask_link = url
        @ask_text = text
      end
    end
  end

  def ask(query)
    agent = Mechanize.new
    @aol = agent.get('http://search.aol.com/aol/webhome')
    aol_form = page.form('CSBsearchForm1')
    aol_form.q = 'ruby mechanize'
    @aol = agent.submit(goggle_form)
  end

  def aol_parse
    @aol.links.each do |link|
      if link.href != nil && link.text != nil
        url = link.href.gsub(/(.*)aol(.*)/,"")
        url = url.gsub(/(.*)google.com(.*)/,"")
        url = url.gsub(/(.*)search?(.*)/,"")
        url = url.gsub(/(.*)about?(.*)/,"")
        url = url.gsub(/javascript(.*)/,"")
        url = url.gsub(/^(?!http(.*)$).*/,"")
        text = link.text.gsub(/(.*)More »(.*)/,"")
        text = text.gsub(/(.*)Mobile Site(.*)/,"")
        @aol_link = url
        @aol_text = text
      end
    end
  end

  def wow(query)
    agent = Mechanize.new
    @wow = agent.get('http://www.wow.com/')
    goggle_form = page.form('SearchBoxForm')
    goggle_form.q = 'ruby mechanize'
    @wow = agent.submit(goggle_form)
  end

  def wow_parse
    @wow.links.each do |link|
      if link.href != nil && link.text != nil
        url = link.href.gsub(/(.*)wow.com(.*)/,"")
        url = link.href.gsub(/(.*)wow.nextag.com(.*)/,"")
        url = url.gsub(/^(?!http(.*)$).*/,"")
        url = url.gsub(/(.*)aol.com(.*)/,"")
        @wow_link = url
        @wow_text = link.text
      end
    end
  end
end
