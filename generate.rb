require 'nokogiri'
require 'pp'
require 'fileutils'
# First we get the list of all the book sections:

chapter_links = Nokogiri::HTML(open("html/index.html"))
  .css('#drop-down a')
  .map {|l| l.attribute('href').value}

html = ''
chapter_links.each do |chapter_link|
  chapter_file = File.basename chapter_link
  html += "<span class=\"hidden\" name=\"#{chapter_file}\"></span>"
  doc = Nokogiri::HTML(open("html/#{chapter_link}"))
  content = doc.css('.content')

  # this title is with additional 'chapter X' in front
  title = doc.at_css('h2.chapter-title').content

  content.css('.cont').each do |e|
    e.remove
  end

  # Ensure that all links are to the same file
  content.css('a').each do |a|
    link = a.attribute('href')
    if link
      matches = link.value.scan /^([\w-]+.html)#([\w-]+)$/
      if matches.length == 1
        a['href'] = '#' + matches[0][1]
      end
    end
  end

  chapter_header = content.at('.heading')

  headers = (1..6).map {|x| "h#{x}"}

  # headers.each_with_index
  content.css(headers.join(',')).each do |e|
    # If chapter heading
    if e == chapter_header
      puts "Chapter Header"
      e.name = 'h1'
    else
      # Reduce everything by 1
      i = headers.index e.name
      new_name = headers[i+1] ? headers[i+1] : 'h6'
      e.name = new_name
    end
  end

  content.css('a').each do |a|
    link = a.attribute('href')
    if link
      # Link to a direct chapter
      matches = link.value.scan /^([\w-]+.html)$/
      if matches.length == 1
        a['href'] = '#' + matches[0][0]
      end
    end
  end

  if content.children.css('section > h1').length > 0
    # remove additional parent section tag
    content = content.children.at_css('section')
  elsif content.children.css('div > h1').length > 0
    # remove additional parent div tag
    content = content.children.at_css('div')
  else
    content
  end

  # replace h1 title
  content.at_css('h1').inner_html = title

  html += content.inner_html
end

File.open("html/chapters/sre.html", 'w') { |file| file.write(html) }
puts "[html] Generated HTML file"
