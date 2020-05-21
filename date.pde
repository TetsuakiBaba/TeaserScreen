String getWeekName() {
  /*
  計算方法はツェラーの公式を参照
   https://ja.wikipedia.org/wiki/%E3%83%84%E3%82%A7%E3%83%A9%E3%83%BC%E3%81%AE%E5%85%AC%E5%BC%8F
   */
  int y = year();
  int m = month();
  int d = day();
  int Y=y % 100;
  int C=int(y/100);
  int L=-2*C+C/4;
  switch( (d+26*(m+1)/10+Y+Y/4+L)%7 )
  {
  case 1:
    return "Sun";
  case 2:
    return "Mon";
  case 3:
    return "Tue";
  case 4:
    return "Wed";
  case 5:
    return "Thr";
  case 6:
    return "Fri";
  case 0:
    return "Sat";
  }
  return "Error";
}

void drawClock(int _x, int _y)
{
  String str_date;
  str_date = nf(month(), 2)+"." +nf(day(), 2)+"."+getWeekName()+"\n";
  str_date = str_date + nf(hour(), 2)+":"+nf(minute(), 2)+":"+nf(second(), 2);
  canvas.text(str_date, _x, _y);
}
