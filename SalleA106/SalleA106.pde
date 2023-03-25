
float rotationX, roationY;
float x, y, z;
float tx, ty, tz;
float xComp, zComp;
int moveX;
int moveZ;
boolean moveUP, moveDOWN, moveLEFT, moveRIGHT;
int mvVitesse = 20;
boolean isDay = true;
boolean isRideauActive =false;
Murs murs;
AccessoiresSalle textures = new AccessoiresSalle();



PShader shader;

PVector[] lightPos = {
  new PVector(300, -300, 300),
  new PVector(0, 0, -300),
};

PVector[] lightColor = {
  new PVector(255, 255, 255),
  new PVector(255, 255, 255)
};


void setup() {
  fullScreen(P3D);
  initVariablesCamera();
  shader = loadShader("shaders/LightShaderTexFrag.glsl", "shaders/LightShaderTexVert.glsl");
}

void draw() {
  background(255);
  noStroke();
  if (!isDay) {
    background(0);
    modeLumiere();
  }
  translate(width/1.7, height/2);
  rotateX(rotationX);
  rotateY(-roationY);
  shape(dessinerSalle());
  updateCamera();
}


PShape dessinerSalle() {
  PShape groupe = createShape(GROUP);
  murs = new Murs(300);
  groupe.addChild(murs.getMurShape());
  groupe.addChild(textures.porteEntre());
  groupe.addChild(textures.tableau());
  groupe.addChild(textures.porteInterieur());
  groupe.addChild(textures.window());
  groupe.addChild(textures.bareFenetre());
  groupe.addChild(textures.chauffage());
  groupe.addChild(textures.dessinerRideau());
  groupe.addChild(textures.rideauEnrouleDerouler(isRideauActive));
  groupe.addChild(textures.television());
  groupe.addChild(remplirSalleBureau(3));
  groupe.rotateY(PI/2);
  return groupe;
}

PShape remplirSalleBureau(int echelle) {
  PShape groupe = createShape(GROUP);

  PShape bureau[] = new PShape[5];
  for (int i = 0; i < bureau.length; i++) {
    Bureau b = new Bureau(echelle, true, false);
    bureau[i] = b.getBureauShape();
  }

  PShape bureau2[] = new PShape[5];
  for (int i = 0; i < bureau2.length; i++) {
    Bureau b = new Bureau(echelle, true, false);
    bureau2[i] = b.getBureauShape();
  }

  PShape bureau3[] = new PShape[5];
  for (int i = 0; i < bureau3.length; i++) {
    Bureau b = new Bureau(echelle, false, false);
    bureau3[i] = b.getBureauShape();
  }

  Bureau bureauProf = new Bureau(echelle, false, true);
  groupe.addChild(bureauProf.getBureauShape());

  for (int i  = 0; i <bureau.length; i++) {
    groupe.addChild(bureau[i]);
    if (i%2==0&&i!=4) bureau[i].translate(0, 0, -140*(i+1));

    else if (i%2!=0 && i>0)  bureau[i].translate(0, 0, -140*(i-1));
  }

  for (int i  = 0; i <bureau2.length; i++) {
    bureau2[i].translate(118, -0, -0);
    groupe.addChild(bureau2[i]);
    if (i%2==0&&i!=4) bureau2[i].translate(0, 0, -140*(i+1));

    else if (i%2!=0 && i>0)  bureau2[i].translate(0, 0, -140*(i-1));
  }
  for (int i  = 0; i <bureau3.length; i++) {
    bureau3[i].translate(118*2, -0, -0);
    groupe.addChild(bureau3[i]);
    if (i%2==0&&i!=4) bureau3[i].translate(0, 0, -140*(i+1));

    else if (i%2!=0 && i>0)  bureau3[i].translate(0, 0, -140*(i-1));
  }

  return groupe;
}


void initVariablesCamera() {
  x = width/2;
  y = height/2;
  z = (height/2.0) / tan(PI*60.0 /360.0);
  tx = width/2;
  ty = height/2;
  tz = 0;
  xComp = tx - x;
  zComp = tz - z;
  moveX = 0;
  moveX = 0;
  moveUP = false;
  moveDOWN = false;
  moveLEFT = false;
  moveRIGHT = false;
}


public void updateCamera() {
  if (moveUP) {
    z += zComp/mvVitesse;
    tz+= zComp/mvVitesse;
    x += xComp/mvVitesse;
    tx+= xComp/mvVitesse;
  } else if (moveDOWN) {
    z -= zComp/mvVitesse;
    tz-= zComp/mvVitesse;
    x -= xComp/mvVitesse;
    tx-= xComp/mvVitesse;
  }
  if (moveRIGHT) {
    z += xComp/mvVitesse;
    tz+= xComp/mvVitesse;
    x -= zComp/mvVitesse;
    tx-= zComp/mvVitesse;
  }
  if (moveLEFT) {
    z -= xComp/mvVitesse;
    tz-= xComp/mvVitesse;
    x += zComp/mvVitesse;
    tx+= zComp/mvVitesse;
  }
  camera(x, y, z, tx, ty, tz, 0, 1, 0);
}

public void keyPressed() {
  if (keyCode == UP || key == 'w') {
    moveZ = -5;
    moveUP = true;
  } else if (keyCode == DOWN || key == 's') {
    moveZ = 5;
    moveDOWN = true;
  } else if (keyCode == LEFT || key == 'a') {
    moveX = -5;
    moveLEFT = true;
  } else if (keyCode == RIGHT || key == 'd') {
    moveX = 5;
    moveRIGHT = true;
  }



  if (key == 'j') {
    isDay = !isDay;
    isRideauActive = false;
  }
  
  if(key == 'k' && isDay )  this.isRideauActive = !this.isRideauActive;
}

public void keyReleased() {
  if (keyCode == UP || key == 'w') {
    moveUP = false;
    moveZ = 0;
  } else if (keyCode == DOWN || key == 's') {
    moveDOWN = false;
    moveZ = 0;
  } else if (keyCode == LEFT || key == 'a') {
    moveLEFT = false;
    moveX = 0;
  } else if (keyCode == RIGHT || key == 'd') {
    moveRIGHT = false;
    moveX = 0;
  }
}


void mouseDragged() {
  roationY -= (mouseX - pmouseX) * 0.01;
  rotationX -= (mouseY - pmouseY) * 0.01;
}

void modeLumiere() {
  for (int i=0; i<lightPos.length; i++) {
    lightSpecular(lightColor[i].x, lightColor[i].y, lightColor[i].z);
    pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z, lightPos[i].x, lightPos[i].y, lightPos[i].z);
  }

  for (int i=0; i<lightPos.length; i++) {
    pushMatrix();
    noStroke();
    emissive(lightColor[i].x, lightColor[i].y, lightColor[i].z);
    translate(lightPos[i].x, lightPos[i].y, lightPos[i].z);
    popMatrix();
  }
  


  shader(shader);
  emissive(0);
  lightSpecular(255, 255, 255);
  shininess(5.0);
  ambientLight(120, 124, 124);
  
}
