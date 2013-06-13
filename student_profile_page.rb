## use gems

require 'nokogiri'
require 'open-uri'
require 'sqlite3'
db = SQLite3::Database.new("students.db")

## create hash to store student data

student = {}

## scrapes HTML

template_doc = Nokogiri::HTML(open('http://students.flatironschool.com/students/katieishibashi.html'))

## gets name into a string
## for other search / select, use .css?

student[:name] = template_doc.css("h4").to_s.chomp("</h4>").sub(/<h4 class="ib_main_header">/, "")

# ["", "https://twitter.com/floggingkatie\"><i class=\"icon-twitter ib-social-icons\"></i></a>", "www.linkedin.com/in/katiebarryishibashi/\"><i class=\"icon-linkedin-sign ib-social-icons\"></i></a>", "https://github.com/katieishibashi\"><i class=\"icon-github ib-social-icons\"></i></a>", "#\"><i class=\"icon-rss ib-social-icons\"></i></a>"]

student[:social_links] = template_doc.css(".social-icons a").to_s.gsub(/\"><i class=\"icon-[a-z-]{2,}\sib-social-icons/, "").gsub(/\"><\/i><\/a>/, "").split("<a href=\"")

puts student[:social_links].inspect

# student[:avatar_image] = 

# student[:background_image] = 

# student[:education] = 

# student[:coder_cred] = 

# db.execute("INSERT INTO students (id, name) 
#             VALUES (?, ?)", [student[:id], student[:name]])
# # use interpolation? 