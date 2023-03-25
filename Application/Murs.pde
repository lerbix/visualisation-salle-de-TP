
class Murs {
  
  private int cote;
  private PShape murs; 

  // couleur Mur
  private final color COULEUR_MUR_GENERAL = color(#efe0cb) ;
  private final color COULEUR_MUR_FAC = color(#e9edc9) ; 
  private final color COULEUR_SOL = color(#CE6C47) ;  
  // image du plafond 
  private final String IMG_PLAFOND = "carrMur2.jpeg";

  
  Murs(int cote) {
     this.cote = cote;
     this.murs = dessinerMurs();
  }

  private PShape dessinerMurs() {
    float taille = cote/2f;
    
    PShape groupe = createShape(GROUP);    

    PShape cFace = createShape();
    cFace.beginShape(QUADS);
    cFace.fill(COULEUR_MUR_FAC);
    cFace.vertex(-taille*3, -taille, taille);
    cFace.vertex( taille, -taille, taille, 0, 1);
    cFace.vertex( taille, taille, taille, 1, 1 );
    cFace.vertex(-taille*3, taille, taille, 1, 0);
    cFace.endShape();

  
    PShape cDroite = createShape();
    cDroite.beginShape(QUADS);
    cDroite.fill(COULEUR_MUR_GENERAL);
    cDroite.vertex(taille, taille, taille, 1, 0);
    cDroite.vertex(taille, taille, -taille*4, 1, 1);
    cDroite.vertex(taille, -taille, -taille*4, 0, 1);
    cDroite.vertex(taille, -taille, taille, 0, 0);
    cDroite.endShape();

    PShape cOpposit = createShape();
    cOpposit.beginShape(QUADS);
    cOpposit.fill(COULEUR_MUR_FAC);
    cOpposit.vertex(taille, -taille, -taille*4, 0, 0);
    cOpposit.vertex(-taille*3, -taille, -taille*4, 0, 1);
    cOpposit.vertex(-taille*3, taille, -taille*4, 1, 1);
    cOpposit.vertex(taille, taille, -taille*4, 1, 0);
    cOpposit.endShape();

    PShape cOppositExt = createShape();
    cOppositExt.beginShape(QUADS);
    cOppositExt.fill(COULEUR_MUR_GENERAL);
    cOppositExt.vertex(taille, -taille, -taille*4 -1, 0, 0);
    cOppositExt.vertex(-taille*3, -taille, -taille*4 -1, 0, 1);
    cOppositExt.vertex(-taille*3, taille, -taille*4 - 1, 1, 1);
    cOppositExt.vertex(taille, taille, -taille*4, 1-1, 0);
    cOppositExt.endShape();


    PShape cSol = createShape();
    cSol.beginShape(QUADS);
    cSol.fill(COULEUR_SOL);
    cSol.vertex(-taille*3, taille, taille, 0, 0);
    cSol.vertex(taille, taille, taille, 0, 1);
    cSol.vertex(taille, taille, -taille*4, 1, 1);
    cSol.vertex(-taille*3, taille, -taille*4, 1, 0);
    cSol.endShape();

    PShape cGauche = createShape();
    cGauche.beginShape(QUADS);
    cGauche.fill(COULEUR_MUR_GENERAL);
    cGauche.vertex(-taille*3, -taille, -taille*4, 0, 0);
    cGauche.vertex(-taille*3, -taille, taille, 0, 1);
    cGauche.vertex(-taille*3, taille, taille, 1, 1);
    cGauche.vertex(-taille*3, taille, -taille*4, 1, 0);
    cGauche.endShape();
    

    PShape cFaceExt = createShape();
    cFaceExt.beginShape(QUADS);
    cFaceExt.fill(COULEUR_MUR_GENERAL);
    cFaceExt.vertex(-taille*3 , -taille, taille+1);
    cFaceExt.vertex( taille , -taille, taille, 0+1, 1);
    cFaceExt.vertex( taille , taille, taille, 1 +1, 1 );
    cFaceExt.vertex(-taille*3 , taille, taille, 1 +1, 0);
    cFaceExt.endShape();
    

    PShape cHExt = createShape();
    cHExt.beginShape(QUADS);
    cHExt.fill(COULEUR_MUR_GENERAL);
    cHExt.vertex(-taille*3, -taille-1, -taille*4, 0, 0);
    cHExt.vertex(taille, -taille-1, -taille*4, 0, 1);
    cHExt.vertex(taille, -taille-1, taille, 1, 1);
    cHExt.vertex(-taille*3, -taille-1, taille, 1, 0);
    cHExt.endShape();
    

    PShape plafond = createShape();
    PImage img = loadImage(IMG_PLAFOND);
    plafond.beginShape(QUADS); 
    plafond.textureMode(NORMAL);
    plafond.texture(img);
    plafond.shininess(200.0);
    plafond.emissive(0, 0, 0);
    plafond.vertex(-taille*3, -taille, -taille*4, 0, 0);
    plafond.vertex(taille, -taille, -taille*4, 0, 1);
    plafond.vertex(taille, -taille, taille, 1, 1);
    plafond.vertex(-taille*3, -taille, taille, 1, 0);
    plafond.endShape();


    groupe.addChild(cFace);
    groupe.addChild(cDroite);
    groupe.addChild(cGauche);
    groupe.addChild(cFaceExt);
    groupe.addChild(cOpposit);
    groupe.addChild(cOppositExt);
    groupe.addChild(cSol);
    groupe.addChild(cHExt);
    groupe.addChild(plafond);

    return groupe;
  }
  
  
  public PShape getMurShape(){
    return this.murs;
  }
}
