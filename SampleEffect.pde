class SampleEffect {
  SampleEffect() {
    canvas = createGraphics(width, height, P2D);
    theta = 0.0;
  }
  void update(){
    canvas.beginDraw();
    canvas.background(#F2E4DC);
    canvas.fill(#DCF2E4);
    canvas.noStroke();
    canvas.arc(width/2, height/2, height/2, height/2, 0, 2*PI*abs(sin(theta)));
    canvas.endDraw();
    theta += 0.01;
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
  float theta;
}
