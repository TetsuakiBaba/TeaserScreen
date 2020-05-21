import codeanticode.syphon.*;
SyphonServer server;
PGraphics canvas;

WarmingGeometry wg;
NoiseLines nls;
PastelStripes ps;
Template template;
Box box;
Bubbles bbls;
StarrySky ss;

int size_of_effect = 7;

PFont f;
int font_size;
void setup()
{
  //fullScreen(P2D);
  size(1280, 720, P2D); // Recommend to use 16:9 ratio
  // comment out for full screen
  //surface.setSize(1280,720); // without window decoration for ZOOM screen sharing use.
  frameRate(30); // slower as possible
  wg = new WarmingGeometry(10, 40, 280);
  nls = new NoiseLines(12, 5);
  ps = new PastelStripes(25);
  template = new Template();
  box = new Box();
  bbls = new Bubbles(40);
  ss = new StarrySky(30);

  font_size = height/10;
  f = createFont("Jaldi-Bold.ttf", font_size);  

  canvas = createGraphics(width, height, P2D);
  server = new SyphonServer(this, "TeaserScreen");
}



String title = "";
boolean flg_begin_workshop = false;
int kind_of_effect = (int)random((int)size_of_effect);


void draw()
{ 
  canvas.beginDraw();
  canvas.textFont(f);
  canvas.textLeading(font_size);
  switch( kind_of_effect )
  {
  case -1: // Thumnail viewer
    canvas.background(0);
    drawThumbnails(4); // number of row 
    break;
  case 0:
    wg.draw();
    canvas.image(wg.canvas, 0, 0);
    canvas.fill(100);
    break;
  case 1:
    nls.draw();
    canvas.image(nls.canvas,0,0);
    canvas.fill(100);
    break;
  case 2:
    ps.draw();
    canvas.image(ps.canvas,0,0);
    canvas.fill(100);
    break;
  case 3:
    template.draw();
    canvas.image(template.canvas,0,0);
    canvas.fill(255);
    break;
  case 4:
    box.draw();
    canvas.image(box.canvas,0,0);
    canvas.fill(255);
    break;
  case 5:
    bbls.draw();
    canvas.image(bbls.canvas,0,0);
    canvas.fill(100);
    break;
  case 6:
    ss.draw();
    canvas.image(ss.canvas,0,0);
    canvas.fill(250);
    break;
  }


  if ( !flg_begin_workshop ) {
    drawClock(width/2, height/4);
    // Draw Typed Message
    if ( title.length() > 0 ) {
      canvas.text(title, width/2, height/2);
    }
  } else {
    canvas.noStroke();
    canvas.fill(0, 0, 0, 150);
    canvas.rect(0, 0, width, height);
    canvas.fill(255);
    canvas.text("It's about to start...", width/2, height/2);
  }
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendImage(canvas);
}

void keyPressed()
{

  //println((int)keyCode);
  if (key == CODED) {  // UP, DOWN, LEFT, and RIGHT) as well as ALT, CONTROL, and SHIFT.

    if (keyCode == UP || keyCode == RIGHT) {
      kind_of_effect++;
      if ( kind_of_effect >= size_of_effect ) kind_of_effect = 0;
    } else if (keyCode == DOWN || keyCode == LEFT) {
      kind_of_effect--;
      if ( kind_of_effect < 0 )kind_of_effect = size_of_effect-1;
    }
  } else { // BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE and other keys
    if ( key == BACKSPACE ) {
      if ( title.length() > 0 ) {
        title = title.substring(0, title.length()-1);
      }
    } else if (keyCode == 97) { // F1
      flg_begin_workshop = !flg_begin_workshop;
    } else if ( keyCode == 106) { //F10: go to thumbnail mode
      kind_of_effect = -1;
    } else {
      title = title + str(key);
    }
  }
}

void drawThumbnails(int _number_of_div) {
  int number_of_div = _number_of_div;
  int margin_x = 10;
  int margin_y = 10;
  int grid_w = (width-(number_of_div+1)*margin_x)/number_of_div;
  int grid_h = (int)(grid_w*(9.0/16.0));

  //////////////////
  PGraphics canvas_effect[] = {
    wg.canvas, nls.canvas, ps.canvas, template.canvas, 
    box.canvas, bbls.canvas, ss.canvas};

  wg.update();
  nls.update();
  ps.update();
  template.update();
  box.update();
  bbls.update();
  ss.update();
  //////////////////

  // margin , margin+grid_w+margin, margin+grid_w+margin+grid_w+margin
  for ( int i = 0; i < canvas_effect.length; i++ ) {
    Rectangle r = new Rectangle(margin_x+(i%number_of_div)*(grid_w+margin_x), 
      margin_y+(grid_h+margin_y)*(i/number_of_div), 
      grid_w, grid_h);

    canvas.image(canvas_effect[i], 
      margin_x+(i%number_of_div)*(grid_w+margin_x), 
      margin_y+(grid_h+margin_y)*(i/number_of_div), 
      grid_w, grid_h);

    if ( r.inside(mouseX, mouseY) ) {
      canvas.fill(200, 150);
      canvas.rect(-5+margin_x+(i%number_of_div)*(grid_w+margin_x), 
        -5+margin_y+(grid_h+margin_y)*(i/number_of_div), 
        grid_w+10, grid_h+10);
      if ( mousePressed ) {          
        kind_of_effect = i;
      }
    }
  }
}

class Rectangle {
  Rectangle(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  boolean inside(int _x, int _y) {
    if ( _x > x && _x < x+w && _y > y && _y < y+h ) {
      return true;
    } else {
      return false;
    }
  }
  int x;
  int y;
  int w;
  int h;
}
