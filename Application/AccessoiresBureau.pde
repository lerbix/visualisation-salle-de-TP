class AccessoiresBureau {

  AccessoiresBureau() {
  }

  public  PShape souris(int position, color couleur) {
    PShape souris = createShape(BOX, 17/position, 15/position, 12/position);
    souris.setFill(couleur);
    return souris;
  }


  public  PShape uniteCentrale(int position, color couleur ) {
    PShape uniteCentrale = createShape(BOX, 60/position, 60/position, 20/position);
    uniteCentrale.setFill(couleur);
    return uniteCentrale;
  }

  public  PShape monitor(int position, color couleur ) {
    PShape monitor = createShape(BOX, 6/position, 80/position, 110/position);
    monitor.setFill(couleur);
    return monitor;
  }

  public  PShape calEcran(int position, color couleur ) {
    PShape calEcran = createShape(BOX, 6/position, 70/position, 15/position);
    calEcran.setFill(couleur);
    return calEcran;
  }


  public  PShape clavier(int position, color couleur ) {
    PShape clavier = createShape(BOX, 30/position, 5/position, 90/position);
    clavier.setFill(couleur);
    return clavier;
  }


  public  PShape reposeCal(int position, color couleur ) {
    PShape reposeCal = createShape(BOX, 35/position, 5/position, 35/position);
    reposeCal.setFill(couleur);
    return reposeCal;
  }

  public  PShape caleLevierEcran(int position, color couleur ) {
    PShape caleLevierEcran = createShape(BOX, 15/position, 10/position, 15/position);
    caleLevierEcran.setFill(couleur);
    return caleLevierEcran;
  }

  public PShape ecranMonitor(String face) {
    PImage img = loadImage(face);
    PShape groupe = createShape(GROUP);
    PShape ecran = createShape();

    float taille = 200/2f;

    ecran.beginShape(QUADS);
    ecran.textureMode(NORMAL);
    ecran.texture(img);
    ecran.shininess(200.0);
    ecran.emissive(0, 0, 0);
    ecran.vertex(taille/5, -taille/8.7, -taille/5.7, 0, 0);
    ecran.vertex(taille/5, -taille/8.7, taille/5.7, 1, 0);
    ecran.vertex(taille/5, taille/8.7, taille/5.7, 1, 1);
    ecran.vertex(taille/5, taille/8.7, -taille/5.7, 0, 1);
    ecran.endShape();

    groupe.addChild(ecran);
    groupe.translate(-20.1, -21, 20);
    groupe.rotateY(PI);

    return groupe;
  }
}
