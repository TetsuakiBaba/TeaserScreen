class  ColorfulTogetoge {
   ColorfulTogetoge() {
    canvas = createGraphics(width, height, P2D);
    theta = 0.0;
    noiseArg = random(100);
    noiseArgR = random(100);
    noiseArgG = random(100);
    noiseArgB = random(100);

  }
  void update(){
    canvas.beginDraw();
    canvas.background(#F2E4DC);
    
    float r = noise(noiseArgR) * 255;
    float g = noise(noiseArgG) * 255;
    float b = noise(noiseArgB) * 255;
    canvas.fill(r, g, b);
    canvas.noStroke();  
    
    canvas.beginShape();
    for(int deg = 0; deg < 360; deg += 2){
      float x = radius * cos(radians(deg)) + width / 2;
      float y = radius * sin(radians(deg)) + height / 2;
      
      if(deg%5==0 || deg%5==1|| deg%5==2){  
        float noiseRadius = noise(x * 0.005, y * 0.005, noiseArg) * radius;
        
        x = noiseRadius * cos(radians(deg)) + width / 2;
        y = noiseRadius * sin(radians(deg)) + height / 2;
  
        canvas.vertex(x, y);
      }
      else{
        float noiseRadius = noise(x * 0.001, y * 0.001, noiseArg) * radius;
        
        x = noiseRadius * cos(radians(deg)) + width / 2;
        y = noiseRadius * sin(radians(deg)) + height / 2;
  
        canvas.vertex(x, y);
      }
    canvas.endShape(CLOSE);
    
    }
        
    canvas.endDraw();
    theta += 0.01;
    noiseArg += 0.008;
    noiseArgR += 0.01;
    noiseArgG += 0.01;
    noiseArgB += 0.01;
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
  float noiseArg;
  int radius = height / 2 ;
  float noiseArgR, noiseArgG, noiseArgB;
  
}
