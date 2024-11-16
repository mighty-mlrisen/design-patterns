require "./htmlTree.rb"
require "./tag.rb"

html_string1 = <<-HTML
<html>
  <body>
    <div class="container1">
      <p class="test">Hello, world!</p>
      <div>
        <h1>jsddj</h1>
      </div>
    </div>
    <div class="container2">
      <h1>Hello, world!</h1>
      <h1>Welcome to the HTML Tree example.</h1>
    </div>
  </body>
</html>
HTML

html_string2 = <<-HTML
<html>
  <body>
    <div class="container1" id="cont_1">
      <p class="container1">Hello, world!</p>
      <p>Welcome to the HTML Tree example.</p>
    </div>
    <div class="container2" id="cont_1">
      <h1>Title 1</h1>
      <h1>Title 2</h1>
    </div>
  </body>
</html>
HTML


tree = HTMLTree.new(html_string2)

puts tree.root.to_s
puts("\n\n")

puts 'DFS:'
tree.dfs.each do |element|
  puts("#{element}")
end

puts "\n\nBFS:"
tree.bfs.each do |element|
  puts("#{element}")
end