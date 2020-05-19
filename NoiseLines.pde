class NoiseLine { //<>// //<>//
  NoiseLine(PGraphics _canvas, int _number_of_vertex) {
    number_of_vertex = _number_of_vertex;
    param_noise = random(1000.0);
    x = 0;
    y = (int)random(height);
    w = width;
    h = height;
    canvas = _canvas;
  }
  int x;
  int y;
  int w;
  int h;
  int number_of_vertex;
  float param_noise;
  PGraphics canvas;
  void draw()
  {
    float step = width/(float)number_of_vertex;
    canvas.stroke(#3C88A6, noise(param_noise)*255);
    canvas.beginShape();
    for ( int i = 0; i <= number_of_vertex; i++ ) {
      canvas.vertex(i*step, noise(param_noise)*height);
      param_noise += 0.001;
    }

    canvas.endShape();
  }
}

class NoiseLines {
  NoiseLines(int _n, int _number_of_vertex) {
    canvas = createGraphics(width, height, P2D);
    nl = new NoiseLine[_n];
    for ( int i = 0; i < _n; i++ ) {
      nl[i] = new NoiseLine(canvas, _number_of_vertex);
    }
  }
  void update(){
    canvas.beginDraw();
    canvas.background(#F2E4DC);
    canvas.noFill();
    canvas.strokeWeight(3);

    for ( int i = 0; i < nl.length; i++ ) {
      nl[i].draw();
    }
    canvas.endDraw();
  }
  void draw() {
    draw(0, 0, width, height);
  }
  void draw(int _x, int _y, int _w, int _h) {
    update();
    image(canvas, _x, _y, _w, _h);
  }
  PGraphics canvas; // canvas of noise lines
  NoiseLine nl[];
}
