class Brasil_ellipse{
  float x;
  float y;
  int go_U;
  int go_Y;
  int big;
  PGraphics canvas;
  float sp;
  
  int r;
  int g;
  int b;
  
  Brasil_ellipse(PGraphics _canvas){
    canvas = _canvas;
    x = random(width);
    y = random(height);
    go_U = (int)random(2);
    go_Y = (int)random(2);
    big = (int)random(5,50);
    sp = random(1,5);
    
    r=(int)random(256);
    g=(int)random(256);
    b=(int)random(256);
    
  }
  void draw() {
    colorMode(RGB,256);
    canvas.fill(r,g,b,100);
    canvas.noStroke();
    canvas.ellipse(x, y, big, big);
    if (go_U==0) { 
      x += sp;
    } else { 
      x -= sp;
    }
    if (go_Y==0) {
      y += sp;
    } else {
      y -= sp;
    }
    if (x<0+big/2) {
      go_U = 0;
    } else if (x>width-big/2) {
      go_U = 1;
    }
    if (y<0+big/2) {
      go_Y = 0;
    } else if (y>height-big/2) {
      go_Y = 1;
    }
  }
}
class Brasil {
  Brasil_ellipse[] b;//sengen
  
  Brasil(int _n) {
    canvas = createGraphics(width, height, P2D);
    
    b = new Brasil_ellipse[_n];//ookisa
    for (int i = 0; i < b.length; i++) {
      b[i] = new Brasil_ellipse(canvas);//seisei
    }
  }
  void update() {
    canvas.beginDraw();
    canvas.background(#F2E4DC);
    for (int i = 0; i < b.length; i++) {
      b[i].draw();
    }
    canvas.endDraw();
  }
  void draw()
  {
    draw(0, 0, width, height);
  }
  void draw(int _x, int _y, int _w, int _h)
  {
    update();
    image(canvas, _x, _y, _w, _h);
  }
  PGraphics canvas;
}
