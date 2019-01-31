require 'nokogiri'
require 'pathname'
require 'fileutils'

# First we get the list of all the book sections:

Dir.chdir("html/landing.google.com/sre/%s/toc" % ENV['BOOK_NAME'])
chapter_links = Nokogiri::HTML(open("index.html"))
  .css('#drop-down a')
  .map {|l| l.attribute('href').value}

html = <<EOT
<!DOCTYPE html>
<html>
  <head>
  <title>#{ENV['BOOK_NAME_FULL']}</title>
  <meta charset="utf-8">
  </head>
  <body>
EOT
chapter_links.each do |chapter_link|
  chapter_file = File.basename File.dirname chapter_link
  html += "<span class=\"hidden\" id=\"#{chapter_file}\"></span>"
  doc = Nokogiri::HTML(open(chapter_link))
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

      matches = link.value.scan /^(\S*index.html)+(#[\w-]+)?/
      # pp [link.value, matches] if link.value and link.value.include? 'lessons-learned'
      if matches.length == 1 and matches[0].length == 2
        # Self Links
        if matches[0][0] =="index.html" and matches[0][1]
          a['href'] = matches[0][1]
        # If it points to start of a different chapter
        else
          chapter_slug = File.basename File.dirname matches[0][0]
          a['href'] = "##{chapter_slug}"
        end
      end
    end
  end

  chapter_header = content.at('.heading')

  headers = (1..6).map {|x| "h#{x}"}

  content.css(headers.join(',')).each do |e|
    # If chapter heading
    if e == chapter_header
      e.name = 'h1'
    else
      # Reduce everything by 1
      i = headers.index e.name
      new_name = headers[i+1] ? headers[i+1] : 'h6'
      e.name = new_name
    end
  end

  content.css('img').each do |img|
    img_file = img.attribute('src')
    if img_file
      chapter_directory = File.dirname chapter_link
      absolute_image_path = Pathname.new File.absolute_path img_file, chapter_directory
      cwd = Pathname.new Dir.pwd
      img['src'] = absolute_image_path.relative_path_from cwd
    end
  end


  if content.children.css('section > h1').length > 0
    # remove additional parent section tag
    content = content.children.at_css('section')
  elsif content.children.css('div > h1').length > 0
    # remove additional parent div tag
    content = content.children.at_css('div')
  end



  # replace h1 title
  content.at_css('h1').inner_html = title

  html += content.inner_html
end

html+="</body></html>"

File.open("complete.html", 'w') { |file| file.write(html) }
puts "[html] Generated HTML file"
