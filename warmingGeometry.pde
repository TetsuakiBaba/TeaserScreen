class Spot {
  Spot(PGraphics _canvas, float _x, float _y, int _c, float _r) {
    x = x_init = _x;
    y = y_init = _y;
    c = _c;
    r = _r;
    param_noise = random(10000.0);
    position_noise_x = random(10000.0);
    position_noise_y = random(10000.0);
    increment_noise = 0.001;
    increment_noise_position = 0.002;
    number_of_vertex = (int)random(3, 6);
    canvas = _canvas;
  }

  void draw()
  {
    param_noise = param_noise+increment_noise;
    position_noise_x += increment_noise_position;
    position_noise_y += increment_noise_position;
    x = x_init + 0.5*height*noise(position_noise_x);
    y = y_init + 0.5*height*noise(position_noise_y);

    canvas.noStroke();
    canvas.fill(c, 200);
    canvas.beginShape();
    for ( float angle = 0.0; angle < 360.0; angle = angle + 360/number_of_vertex ) {
      float circle_noise = 0.5*height*noise(
        param_noise+cos(radians(angle)), 
        param_noise+sin(radians(angle))
        );

      canvas.vertex(
        x + (r+circle_noise)*cos(radians(angle)), 
        y + (r+circle_noise)*sin(radians(angle)));
    }
    canvas.endShape();
  }

  float x;
  float y;
  float x_init;
  float y_init;
  int c;
  float r;
  float param_noise;
  float position_noise_x;
  float position_noise_y;
  float increment_noise;
  float increment_noise_position;
  int number_of_vertex;
  PGraphics canvas;
};

class WarmingGeometry {
  WarmingGeometry(int _n, float _r_min, float _r_max) {
    int[] c = new int[]{#3C88A6, #C6D4C8, #F2DC9B, #CB862C, #D99C9C};
    canvas = createGraphics(width, height, P2D);
    spot = new Spot[_n];
    for ( int i = 0; i < spot.length; i++ ) {
      spot[i] = new Spot(canvas, random(width), random(height), c[int(random(c.length))], random(_r_min, _r_max));
    }
  }
  void update()
  {
    canvas.beginDraw();
    canvas.background(#F2E4DC);
    //background(200,200,200,5);

    for ( int i = 0; i < spot.length; i++ ) {
      spot[i].draw();
    }
    canvas.endDraw();
  }
  void draw() {
    draw(0, 0, width, height);
  }
  void draw( int _x, int _y, int _w, int _h)
  {
    update();
    image(canvas, _x, _y, _w, _h);
  }
  PGraphics canvas;
  Spot spot[];
};
