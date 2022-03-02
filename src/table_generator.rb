#Template Method Pattern
#Date: 28/02/2022
# Authors:
#   A01376228   Sebastian Morales Martin
#   A01745219   Eduardo Roberto Muller Romero

# File name: table_generator.rb (from arielortiz.info)

class TableGenerator

  def initialize(header, data)
    @header = header
    @data = data
  end

  def generate
    generate_header_row + (@data.map {|x| generate_row(x)}).join
  end

  def generate_header_row
    (@header.map {|x| generate_header_item(x)}).join
  end

  def generate_item(item)
    item
  end

  def generate_row(row)
    (row.map {|x| generate_item(x)}).join
  end

  def generate_header_item(item)
    item
  end

end

class CSVTableGenerator < TableGenerator

  def generate_row(row)
    "#{(row.map {|x| generate_item(x)}).join(',')}\n"
  end

  def generate_header_row
    generate_row(@header)
  end

end

class HTMLTableGenerator < TableGenerator

  def generate_row(row)
    "<tr>#{(row.map {|x| generate_item(x)}).join('</tr>')\n"
  end

  def generate_header_row
    "<table>#{generate_row(@header)}</table>"
  end

end

class AsciiDocTableGenerator < TableGenerator

  def generate_row(row)
  end

  def generate_header_row
    
  end

end