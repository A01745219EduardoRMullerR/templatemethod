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

  def generate
    "<table>\n" + generate_header_row(@header) + (@data.map {|x| generate_row(x)}).join + "</table>\n"
  end

  def generate_row(row)
    "<tr>#{(row.map {|x| '<td>' + generate_item(x.to_s)}).join('</td>')}</td></tr>\n"
  end

  def generate_header_row(header)
    "<tr>#{(header.map {|x| '<th>' + generate_item(x)}).join('</th>')}</th></tr>\n"
  end

end