## Scrape student profile page data into a table. 
## - Look at source code: What buckets do we need?
## - Create table
## - Create appropriate vessels for data
## - 

require 'nokogiri'
require 'open-uri'
template_doc = Nokogiri::HTML(open('http://students.flatironschool.com/students/katieishibashi.html'))

student_name = template_doc.css("h4").to_s.chomp("</h4>").sub(/<h4 class="ib_main_header">/, "")

puts student_name 

## name - <h4
## social media links
## avatar image
## background image
## education text
## bio text
## work text
## coder cred links
