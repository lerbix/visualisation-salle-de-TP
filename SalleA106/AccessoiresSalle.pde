
class AccessoiresSalle {


  // COULEURS DES ACCESSOIRES DE LA SALLE
  // COULEUR DU TABLEAU
  private final color COULEUR_TABLEAU = color(66, 85, 58);
  // COULEUR DU RIDEAU
  private final color COULEUR_RIDEAU = color(199, 207, 214);
  // COULEUR DE FENETRES
  private final color COULEUR_BAR_FENETRE = color(239,224,204,255);
  // COULEUR DU CHAUFFAGE
  private final color COULEUR_CHAUFFAGE = color(229, 229, 224);


  // TEXTURES
  // DOS DE LA PORTE 1
  private final String IMG_PORTE1_DOS = "A106dos.jpg";
  // FACE DE LA PORTE 1
  private final String IMG_PORTE1_FACE = "A106Face.jpeg";

  // FENETRE
  private final String FENETRE = "f3.jpg";
  // IMAGE ECRAN MONITOR
  private final String IMG_MONITOR = "ecranStream.png";


  public AccessoiresSalle() {
  }

  PShape tableau() {
    PShape tableau = createShape(BOX, 400, 150, 3);
    tableau.translate(-215, 0, 148);
    tableau.setFill(COULEUR_TABLEAU);
    return tableau;
  }



  PShape dessinerRideau() {
    PShape rideauTableau = createShape(BOX, 150, 10, 8);
    rideauTableau.translate(-100, -87, 144);
    rideauTableau.setFill(color(199, 207, 214));
    return rideauTableau;
  }

  PShape porteEntre() {
    PShape porteEntreTexture = formePourTexture(200, -75, 4, IMG_PORTE1_DOS, IMG_PORTE1_FACE);
    porteEntreTexture.translate(-145.5, 0, -600);
    porteEntreTexture.rotateY(PI/2);
    return porteEntreTexture;
  }


  PShape porteInterieur() {
    PShape groupe = createShape(GROUP);
    PShape porteInterieurTexture []= {formePourTexture(200, -75, 4, IMG_PORTE1_DOS, IMG_PORTE1_DOS), formePourTexture(200, -75, 4, IMG_PORTE1_DOS, IMG_PORTE1_DOS)};

    for (int i  = 0; i <porteInterieurTexture.length; i++) {
      groupe.addChild(porteInterieurTexture[i]);
      if (i%2!=0) {
        porteInterieurTexture [i].translate(0, 0, -750);
      }
    }
    return groupe;
  }



  PShape window() {
    PImage image = loadImage(FENETRE);
    PShape groupe = createShape(GROUP);

    PShape c = createShape();
    PShape s = createShape();

    float cc = 200/2f;
    c.beginShape(QUADS);
    c.textureMode(NORMAL);
    c.shininess(200.0);
    c.emissive(0, 0, 0);

    //fenetre
    c.fill(color(#efe0cb));
    c.vertex(cc, cc*3/4, cc, 0, 0);
    c.vertex(cc, cc*3/4, -cc*6.3, 1, 0);
    c.vertex(cc, -cc*3/4, -cc*6.3, 1, 1);
    c.vertex(cc, -cc*3/4, cc, 0, 1);
    c.endShape();

    //opposit face
    s.beginShape(QUADS);
    s.textureMode(NORMAL);
    s.texture(image);
    s.shininess(200.0);
    s.emissive(0, 0, 0);
    s.vertex(cc-2, -cc*3/4, -cc*6.3, 0, 0);
    s.vertex(cc-2, -cc*3/4, cc, 1, 0);
    s.vertex(cc-2, cc*3/4, cc, 1, 1);
    s.vertex(cc-2, cc*3/4, -cc*6.3, 0, 1);
    s.endShape();

    groupe.addChild(c);
    groupe.addChild(s);
    groupe.translate(50.5, -40, 30);

    return groupe;
  }

  PShape bareFenetre() {
    PShape bareFenetre = createShape(BOX, 25, 299, 40);
    bareFenetre.translate(137, -1, -383);
    bareFenetre.setFill(COULEUR_BAR_FENETRE);
    return bareFenetre;
  }


  PShape rideauEnrouleDerouler(boolean enrouler) {

    PShape rideauEnrouler = null;
    rideauEnrouler = createShape(BOX, 130, 8, 2);
    rideauEnrouler.translate(-100, -78, 144);

    if (enrouler == true) {
      PShape group = createShape(GROUP);

      // rideau
      rideauEnrouler = createShape(BOX, 130, 120, 2);
      rideauEnrouler.translate(-100, -22, 144);
      rideauEnrouler.setFill(color(255));
      group.addChild(rideauEnrouler);

      // contenu
      PImage img = loadImage(IMG_MONITOR);
      PShape contenu = createShape(GROUP);
      PShape s = createShape();

      float cc = 300;

      
      s.beginShape(QUADS);
      
      s.textureMode(NORMAL);
      s.texture(img);
      s.shininess(200.0);
      s.emissive(0, 0, 0);
      s.vertex(cc/5, -cc/6, -cc/5.7, 0, 0);
      s.vertex(cc/5, -cc/6, cc/5.7, 1, 0);
      s.vertex(cc/5, cc/6, cc/5.7, 1, 1);
      s.vertex(cc/5, cc/6, -cc/5.7, 0, 1);
      s.endShape();

      contenu.addChild(s);

      contenu.rotateY(PI/2);
      contenu.translate(-100, -21, 200);



      group.addChild(contenu);


      return group;
    }

    rideauEnrouler.setFill(color(255));
    return rideauEnrouler;
  }

  PShape formePourTexture(int cote, int x, int y, String face, String oppose) {
    PImage img = loadImage(face);
    PImage img2 = loadImage(oppose);
    PShape groupe = createShape(GROUP);

    PShape c = createShape();
    PShape s = createShape();


    float cc = cote/2f;
    c.beginShape(QUADS);
    c.textureMode(NORMAL);
    c.texture(img);
    c.shininess(200.0);
    c.emissive(0, 0, 0);

    //face
    c.fill(color(0));
    c.vertex(-cc/x, -cc, -cc+y, 0, 0);
    c.vertex( cc, -cc, -cc+y, 1, 0);
    c.vertex( cc, cc, -cc+y, 1, 1);
    c.vertex(-cc/x, cc, -cc+y, 0, 1);
    c.endShape();

    s.beginShape(QUADS);
    s.textureMode(NORMAL);
    s.texture(img2);
    s.shininess(200.0);
    s.emissive(0, 0, 0);

    //opposit face
    s.vertex(cc, -cc, -cc, 0, 0);
    s.vertex(-cc/x, -cc, -cc, 1, 0);
    s.vertex(-cc/x, cc, -cc, 1, 1);
    s.vertex(cc, cc, -cc, 0, 1);
    s.endShape();

    groupe.addChild(c);
    groupe.addChild(s);

    groupe.translate(20, 50, 248);

    return groupe;
  }


  PShape chauffage() {
    PShape groupe = createShape(GROUP);
    
    PShape chauffage1 = createShape(BOX, 5, 80, 200);
    PShape chauffage2 = createShape(BOX, 10, 80, 150);
    chauffage1.translate(144, 95, -100);
    chauffage2.translate(144, 95, -500);
    groupe.addChild(chauffage1);
    groupe.addChild(chauffage2);
    groupe.setFill(COULEUR_CHAUFFAGE);
    return groupe;
  }

  PShape television() {

    PShape groupe = createShape(GROUP);
    PShape monitor = createShape(BOX, 6, 100, 130);
    monitor.setFill(color(0));
    PShape tigeMoniteur = createShape(BOX, 6, 100, 15);
    tigeMoniteur.setFill(color(0));

    PShape piedMoniteur = createShape(BOX, 50, 15, 50);
    piedMoniteur.setFill(color(0));

    monitor.translate(30, 10, 30);
    tigeMoniteur.translate(30, 97, 30);
    piedMoniteur.translate(30, 142, 30); // 115
    groupe.addChild(monitor);
    groupe.addChild(tigeMoniteur);
    groupe.addChild(ecranProjection("ecranStream.png"));
    groupe.addChild(piedMoniteur);
    groupe.rotateY(-PI/4);

    return groupe;
  }


  PShape ecranProjection(String ecranImg) {

    PImage img = loadImage(ecranImg);
    PShape groupe = createShape(GROUP);
    PShape ecran = createShape();
    float c = 700/2f;
    ecran.beginShape(QUADS);
    ecran.textureMode(NORMAL);
    ecran.texture(img);
    ecran.shininess(200.0);
    ecran.emissive(0, 0, 0);  
    ecran.setFill(0);
    ecran.vertex(c/5, -c/8.7, -c/5.7, 0, 0);
    ecran.vertex(c/5, -c/8.7, c/5.7, 1, 0);
    ecran.vertex(c/5, c/8.7, c/5.7, 1, 1);
    ecran.vertex(c/5, c/8.7, -c/5.7, 0, 1);
    ecran.endShape();


    AccessoiresBureau ab = new AccessoiresBureau();
    groupe.addChild(ab.monitor((int)c, color(0)));

    groupe.addChild(ecran);
    groupe.translate(-44, 10, 30);
    return groupe;
  }
}
