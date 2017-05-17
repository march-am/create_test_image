require 'kconv'
require 'colorable'
include Colorable

jp_font = '/System/Library/Fonts/ヒラギノ角ゴシック W9.ttc'

cs = Colorset.new

File.open('tiptest.csv') do |fh|
  fh.each_line do |line|
    array_data = line.split(',')
    txt_contents = array_data[0].toutf8
    size_w = array_data[1]
    size_h = array_data[2]
    file_name = array_data[3]

    c = cs.at
    c.mode = :HSB
    tc = c + [180, 0, 0]
    bg_color = c.hex
    text_color = tc.hex
    cs.next

    cmd = "convert -font \"#{jp_font}\" -size #{size_w}x#{size_h} xc:'#{bg_color}' -fill '#{text_color}' -pointsize 30 -draw \"text 10,50 '#{txt_contents}'\" -channel Default image/#{file_name}"
    # puts cmd
    system (cmd)
  end
end
