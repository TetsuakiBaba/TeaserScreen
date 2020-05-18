
class Box {
  PGraphics canvas;
  float rotX, rotY, rotZ, time;
  int boxNum;
  float posX[];
  float posY[];
  float posZ[];
  float boxSize[];
  int boxColor[];
  int color_palette[] = {#30A9D9, #D9B341, #F29D35, #F28963, #F24535};

  Box() {
    canvas = createGraphics(width, height, P3D);
    canvas.rectMode(CENTER);
    boxNum = 30;
    boxSize = new float[boxNum];
    posX = new float[boxNum];
    posY = new float[boxNum];
    posZ = new float[boxNum];
    boxColor = new int[boxNum];

    for (int i = 0; i < boxNum; i++) {
      boxSize[i] = random(10, 40);
      posX[i] = random(-80, 80);
      posY[i] = random(-80, 80);
      posZ[i] = random(-80, 80);
      boxColor[i] = color_palette[(int)random(color_palette.length)];
    }

    rotX = 0.0;
    rotY = 0.0;
    rotZ = 0.0;
    time = 0.0;
  }

  void update() {
    canvas.beginDraw();
    canvas.background(#F2E4DC);

    //それぞれの軸の回転角度を更新
    time += 0.01;
    rotX += noise(time)*0.01;
    rotY += noise(time)*0.01;
    rotZ += noise(time)*0.01;
    canvas.translate(width/2, height/2);
    canvas.directionalLight(126, 126, 126, 0, 0, -1);
    canvas.ambientLight(150, 150, 150);
    canvas.camera(0, 0, 100, 0, 0, 0, 0, 1, 0);
    canvas.perspective(20, float(width)/float(height), 
      0.1, 1000);

    for (int i = 0; i < boxNum; i++) {
     
      canvas.pushMatrix();
      //X軸を中心に回転
      canvas.rotateX(rotX);
      //Y軸を中心に回転
      canvas.rotateY(rotY);
      //Z軸を中心に回転
      canvas.rotateZ(rotZ);
      canvas.noStroke();
      canvas.fill(boxColor[i], 200);
      canvas.translate(posX[i], posY[i], posZ[i]);
      canvas.box(boxSize[i]);
      canvas.popMatrix();
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
