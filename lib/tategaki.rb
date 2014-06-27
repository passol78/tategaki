# encoding: utf-8

def hankaku? value
  if(/[ -~｡-ﾟ]/ =~ value)
    true
  else
    false
  end
end


def tategaki (items)
  kaomoji = "(´・с_・｀)"
  kado_left_up = "┌"
  kado_right_up = "┐"
  kado_left_down = "└"
  kado_right_down = "┘"
  
  separater = "─"
  kabe = "│"
  retu = items.size
  gyou = nil

  # 最大の文字数を取得して、空白埋めする
  max = 0
  items.each do |item| max = item.size if max < item.size end
  items = items.map do |item| item.ljust(max, "　") end
  items.reverse!

  (-1..max).step do |i|
    if i == -1
      puts kado_left_up + "".rjust(retu, separater) + kado_right_up
      next
    elsif i == max
      puts kado_left_down + "".rjust(retu, separater) + kado_right_down + kaomoji
      next
    else
      puts kabe + (items.map do |hoge| if hankaku?(hoge[i]) then hoge[i] + " " else hoge[i] end  end.join) + kabe
    end
  end
end


