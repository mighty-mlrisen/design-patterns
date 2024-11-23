Dir.chdir('/Users/artemmazurenko/design-patterns/collections/html_tree') # меняем рабочую директорию
require "./htmlTree.rb"
require "./tag.rb"


html_string2 = <<-HTML
<html>
  <body>
    <div class="container1" id="cont_div">
      <p class="paragraph1">Hello, world!</p>
      <p>HTML Tree example.</p>
    </div>
    <div class="container2" id="cont_div">
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