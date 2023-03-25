
class AccessoiresSalle {


  // COULEURS DES ACCESSOIRES DE LA SALLE
  // COULEUR DU TABLEAU
  private final color COULEUR_TABLEAU = color(66, 85, 58);
  // COULEUR DU RIDEAU
  private final color COULEUR_RIDEAU = color(199, 207, 214);
  // COULEUR DE FENETRES
  private final color COULEUR_BAR_FENETRE = color(239, 224, 204, 255);
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
    PShape porteEntreTexture = porte(200, -75, 4, IMG_PORTE1_DOS, IMG_PORTE1_FACE);
    porteEntreTexture.translate(-145.5, 0, -600);
    porteEntreTexture.rotateY(PI/2);
    return porteEntreTexture;
  }


  PShape porteInterieur() {
    PShape groupe = createShape(GROUP);
    PShape porteInterieurTexture []= {porte(200, -75, 4, IMG_PORTE1_DOS, IMG_PORTE1_DOS), porte(200, -75, 4, IMG_PORTE1_DOS, IMG_PORTE1_DOS)};

    for (int i  = 0; i <porteInterieurTexture.length; i++) {
      groupe.addChild(porteInterieurTexture[i]);
      if (i%2!=0) {
        porteInterieurTexture [i].translate(0, 0, -750);
      }
    }
    return groupe;
  }



  PShape Fenetre() {
    float taille = 200/2f;
    PImage image = loadImage(FENETRE);
    PShape groupe = createShape(GROUP);

    PShape fenetreFace = createShape();
    fenetreFace.beginShape(QUADS);
    fenetreFace.textureMode(NORMAL);
    fenetreFace.shininess(200.0);
    fenetreFace.fill(color(#efe0cb));
    fenetreFace.vertex(taille, taille*3/4, taille, 0, 0);
    fenetreFace.vertex(taille, taille*3/4, -taille*6.3, 1, 0);
    fenetreFace.vertex(taille, -taille*3/4, -taille*6.3, 1, 1);
    fenetreFace.vertex(taille, -taille*3/4, taille, 0, 1);
    fenetreFace.endShape();

    PShape fenetreOpp = createShape();
    fenetreOpp.beginShape(QUADS);
    fenetreOpp.textureMode(NORMAL);
    fenetreOpp.texture(image);
    fenetreOpp.shininess(200.0);
    fenetreOpp.emissive(0, 0, 0);
    fenetreOpp.vertex(taille-2, -taille*3/4, -taille*6.3, 0, 0);
    fenetreOpp.vertex(taille-2, -taille*3/4, taille, 1, 0);
    fenetreOpp.vertex(taille-2, taille*3/4, taille, 1, 1);
    fenetreOpp.vertex(taille-2, taille*3/4, -taille*6.3, 0, 1);
    fenetreOpp.endShape();

    groupe.addChild(fenetreFace);
    groupe.addChild(fenetreOpp);
    groupe.translate(50.5, -40, 30);

    return groupe;
  }

  PShape bareFenetre() {
    PShape bareFenetre = createShape(BOX, 25, 299, 40);
    bareFenetre.translate(137, -1, -383);
    bareFenetre.setFill(COULEUR_BAR_FENETRE);
    return bareFenetre;
  }


  PShape ecranProjecteur(boolean enrouler) {
    PShape ecranProjecteur = null;
    ecranProjecteur = createShape(BOX, 130, 8, 2);
    ecranProjecteur.translate(-100, -78, 144);
    if (enrouler == true) {
      PShape group = createShape(GROUP);

      ecranProjecteur = createShape(BOX, 130, 120, 2);
      ecranProjecteur.translate(-100, -22, 144);
      ecranProjecteur.setFill(color(255));
      group.addChild(ecranProjecteur);

      // contenu
      PImage img = loadImage(IMG_MONITOR);
      PShape contenu = createShape(GROUP);
      PShape ecran = createShape();

      float taille = 300;
      ecran.beginShape(QUADS);
      ecran.textureMode(NORMAL);
      ecran.texture(img);
      ecran.shininess(200.0);
      ecran.emissive(0, 0, 0);
      ecran.vertex(taille/5, -taille/6, -taille/5.7, 0, 0);
      ecran.vertex(taille/5, -taille/6, taille/5.7, 1, 0);
      ecran.vertex(taille/5, taille/6, taille/5.7, 1, 1);
      ecran.vertex(taille/5, taille/6, -taille/5.7, 0, 1);
      ecran.endShape();

      contenu.addChild(ecran);

      contenu.rotateY(PI/2);
      contenu.translate(-100, -21, 200);



      group.addChild(contenu);


      return group;
    }

    ecranProjecteur.setFill(color(255));
    return ecranProjecteur;
  }

  PShape porte(int cote, int x, int y, String face, String oppose) {
    PImage imgFace = loadImage(face);
    PImage imgOpp = loadImage(oppose);
    float taille = cote/2f;

    PShape groupe = createShape(GROUP);

    PShape porteFace = createShape();
    porteFace.beginShape(QUADS);
    porteFace.textureMode(NORMAL);
    porteFace.texture(imgFace);
    porteFace.shininess(200.0);
    porteFace.emissive(0, 0, 0);
    porteFace.fill(color(0));
    porteFace.vertex(-taille/x, -taille, -taille+y, 0, 0);
    porteFace.vertex( taille, -taille, -taille+y, 1, 0);
    porteFace.vertex( taille, taille, -taille+y, 1, 1);
    porteFace.vertex(-taille/x, taille, -taille+y, 0, 1);
    porteFace.endShape();

    PShape porteOppose = createShape();
    porteOppose.beginShape(QUADS);
    porteOppose.textureMode(NORMAL);
    porteOppose.texture(imgOpp);
    porteOppose.shininess(200.0);
    porteOppose.emissive(0, 0, 0);
    porteOppose.vertex(taille, -taille, -taille, 0, 0);
    porteOppose.vertex(-taille/x, -taille, -taille, 1, 0);
    porteOppose.vertex(-taille/x, taille, -taille, 1, 1);
    porteOppose.vertex(taille, taille, -taille, 0, 1);
    porteOppose.endShape();

    groupe.addChild(porteFace);
    groupe.addChild(porteOppose);

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
    groupe.addChild(ecranTelevision("ecranStream.png"));
    groupe.addChild(piedMoniteur);
    groupe.rotateY(-PI/4);

    return groupe;
  }


  PShape ecranTelevision(String ecranImg) {
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
