class Bubble {
  int x;
  int y;
  int d;
  float vx;
  float vy;
  float noise_param;
  int color_palette[] = {#7ADAFF, #6FE6E8, #88FFDF, #6FE8A6, #7AFF91};
  int c;

  Bubble() {
    y = (int)random(height + d/2, height + d/2 + 1000);;
    d = (int)random(20, 100);
    vx = random(0.002, 0.01);
    vy = random(2, 6);
    noise_param = random(0, 1000);
    c = color_palette[(int)random(color_palette.length)];
  }

  void draw() {
    noStroke();
    fill(c, 150);
    ellipse(x, y, d, d);
    x = (int)(displayWidth * noise(noise_param));
    y -= vy;
    if (y <= -d) {
      y = height + d;
    }
    noise_param += vx;
  }
}

class Bubbles {
  Bubble[] b;//sengen
  
  Bubbles(int _n) {
    canvas = createGraphics(width, height, P2D);
    
    b = new Bubble[_n];//ookisa
    for (int i = 0; i < b.length; i++) {
      b[i] = new Bubble();//seisei
    }
  }
  void update(){
    canvas.beginDraw();
    canvas.background(#FFFFFF);
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
    
    for (int i = 0; i < b.length; i++) {
      b[i].draw();
    }
  }
  PGraphics canvas;
  float theta;
}
