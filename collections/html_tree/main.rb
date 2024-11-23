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


puts "\nМетод count для дерева: #{tree.count}"
puts "\nМетод find для дерева (условие - имя 'p'): #{tree.find{|x| x.name == "p"}.to_s}"
puts "\nМетод count с условием (имя div): #{tree.count{|x| x.name == "div"}}"
puts "\nКоличество детей у первого наследника корня: #{tree.root.children[0].count_child}"


puts "\nDFS:"
tree.dfs.each do |element|
  puts("#{element}")
end

puts "\n\nBFS:"
tree.bfs.each do |element|
  puts("#{element}")
end

puts "\n\n select: "

empty_tags = tree.select {|tag| tag.has_attributes?}

empty_tags.each do |tag| 
  puts tag
end