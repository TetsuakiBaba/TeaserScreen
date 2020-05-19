class Star{
  PGraphics canvas;
  float angle;
  float rotateangle;
  float x;
  float y;
  int d;
  int starNum;
  int R;
  int r;
  int c;
  int color_palette[] = {#BC9EC1, #FDE8E9, #F3FFB9, #EDF2F4, #FFA69E};
  
  Star(PGraphics _canvas) {
    canvas = _canvas;
    angle = 0;
    rotateangle = 0;
    x = 0;
    y = 0;
    starNum = (int)random(15, 30);
    R = (int)random(80, 1000);
    d = (int)random(2, 5);
    r = (int)random(10, 30);
    c = color_palette[(int)random(color_palette.length)];
  }
  
    void draw(){
    canvas.noStroke();
    for(int i = 0; i < starNum; i++){
    angle = i * 360 / starNum + rotateangle;
    x = R * cos(radians(angle)) + r;
    y = R * sin(radians(angle)) + r;
    canvas.fill(c);
    canvas.ellipse(width/2 + x, height/4 + y, d, d);
    rotateangle += 0.005;
    }
  }
}

class StarrySky {
  PGraphics canvas;
  Star s[];
  
  StarrySky(int _n){
     canvas = createGraphics(width, height, P2D);
     s = new Star[_n];
    for(int i = 0; i < s.length; i++){
      s[i] = new Star(canvas);
    }
  }
  
  void update(){
    canvas.beginDraw();
    canvas.fill(#2E294E, 130);
    canvas.rect(0,0,width, height);
    for(int i = 0; i < s.length; i++){
      s[i].draw();
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
}
