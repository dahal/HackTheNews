# Arthor : Puru Dahal
require 'sinatra' #gem install sinatra
require 'nokogiri'#gem install nokogiri
require 'open-uri'

set :port, 3000
set :environment, :production

doc = Nokogiri::HTML(File.open('HackerNews.html'))

# def first_child(doc)
#   doc.search('.subtext > span:first-child').map { |span| span.inner_text}
# end

# def nth_child(doc)
#   doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
# end

def all_post(doc)
  posts = doc.search('.title > a:first-child').map { |link| link.inner_text}
end




get '/' do
  <<-EOT
  <!DOCTYPE html>
  <html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Hack The News</title>
      <link href="http://bootswatch.com/darkly/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>



    <br>
        <center><h1 style="font-size: 80px">Hack The News</h1></center>
        <br><br>
          <hr>
          <div class="container">
            <center><h2>Today's Crap</h2></center><br>
            <div class="col-md-8 col-md-offset-2">
              <p>#{all_post(doc).join("</p><p>")}</p>
            <br>
            </div>
          </div>
    </body>
  </html>

  EOT
end