
class Murs {
  
  private int cote;
  private PShape murs; 

  // couleur face
  private final color COULEUR_MUR = color(#efe0cb) ;
  private final color COULEUR_SOL = color(#efe0cb) ;
  // couleur HAUT EXTERIEUR
  private final color COULEUR_HAUT_EXT = color(#efe0cb);
  
  // TEXTURES
  // image du plafond 
  private final String IMG_PLAFOND = "carrMur2.jpeg";
  //Image du sol 
  //private final String IMG_SOL = "sol2.jpeg";
  
  Murs(int cote) {
     this.cote = cote;
     this.murs = dessinerMurs();
  }

  private PShape dessinerMurs() {
   PShape c = createShape();
    PShape s = createShape();

    float cc = cote/2f;
    c.beginShape(QUADS);

    PImage img = loadImage(IMG_PLAFOND);
    PShape groupe = createShape(GROUP);    


    PShape cFace = createShape();
    cFace.beginShape(QUADS);
    cFace.fill(color(#e9edc9));
    cFace.vertex(-cc*3, -cc, cc);
    cFace.vertex( cc, -cc, cc, 0, 1);
    cFace.vertex( cc, cc, cc, 1, 1 );
    cFace.vertex(-cc*3, cc, cc, 1, 0);
    cFace.endShape();

  
    PShape cDroite = createShape();
    cDroite.beginShape(QUADS);
    cDroite.fill(COULEUR_MUR);
    cDroite.vertex(cc, cc, cc, 1, 0);
    cDroite.vertex(cc, cc, -cc*4, 1, 1);
    cDroite.vertex(cc, -cc, -cc*4, 0, 1);
    cDroite.vertex(cc, -cc, cc, 0, 0);
    cDroite.endShape();

    //opposit face 
    PShape cOpposit = createShape();
    cOpposit.beginShape(QUADS);
    cOpposit.fill(color(#E8FCFB));
    cOpposit.vertex(cc, -cc, -cc*4, 0, 0);
    cOpposit.vertex(-cc*3, -cc, -cc*4, 0, 1);
    cOpposit.vertex(-cc*3, cc, -cc*4, 1, 1);
    cOpposit.vertex(cc, cc, -cc*4, 1, 0);
    cOpposit.endShape();
    
    // opposit Ext 
    PShape cOppositExt = createShape();
    cOppositExt.beginShape(QUADS);
    cOppositExt.fill(COULEUR_MUR);
    cOppositExt.vertex(cc, -cc, -cc*4 -1, 0, 0);
    cOppositExt.vertex(-cc*3, -cc, -cc*4 -1, 0, 1);
    cOppositExt.vertex(-cc*3, cc, -cc*4 - 1, 1, 1);
    cOppositExt.vertex(cc, cc, -cc*4, 1-1, 0);
    cOppositExt.endShape();

    //bas
    PShape cSol = createShape();
    cSol.beginShape(QUADS);
    cSol.fill(color(#CE6C47));
    cSol.vertex(-cc*3, cc, cc, 0, 0);
    cSol.vertex(cc, cc, cc, 0, 1);
    cSol.vertex(cc, cc, -cc*4, 1, 1);
    cSol.vertex(-cc*3, cc, -cc*4, 1, 0);
    cSol.endShape();

    //gauche
    PShape cGauche = createShape();
    cGauche.beginShape(QUADS);
    cGauche.fill(COULEUR_MUR);
    cGauche.vertex(-cc*3, -cc, -cc*4, 0, 0);
    cGauche.vertex(-cc*3, -cc, cc, 0, 1);
    cGauche.vertex(-cc*3, cc, cc, 1, 1);
    cGauche.vertex(-cc*3, cc, -cc*4, 1, 0);
    cGauche.endShape();
    
    //Face Exterieur
    PShape cFaceExt = createShape();
    cFaceExt.beginShape(QUADS);
    cFaceExt.fill(COULEUR_MUR);
    cFaceExt.vertex(-cc*3 , -cc, cc+1);
    cFaceExt.vertex( cc , -cc, cc, 0+1, 1);
    cFaceExt.vertex( cc , cc, cc, 1 +1, 1 );
    cFaceExt.vertex(-cc*3 , cc, cc, 1 +1, 0);
    cFaceExt.endShape();
    

    //hautExterieur
    PShape cHExt = createShape();
    cHExt.beginShape(QUADS);
    cHExt.fill(COULEUR_MUR);
    cHExt.vertex(-cc*3, -cc-1, -cc*4, 0, 0);
    cHExt.vertex(cc, -cc-1, -cc*4, 0, 1);
    cHExt.vertex(cc, -cc-1, cc, 1, 1);
    cHExt.vertex(-cc*3, -cc-1, cc, 1, 0);
    cHExt.endShape();
    

    // haut interieur
    s.beginShape(QUADS); 
    s.textureMode(NORMAL);
    s.texture(img);
    s.shininess(200.0);
    s.emissive(0, 0, 0);
    s.vertex(-cc*3, -cc, -cc*4, 0, 0);
    s.vertex(cc, -cc, -cc*4, 0, 1);
    s.vertex(cc, -cc, cc, 1, 1);
    s.vertex(-cc*3, -cc, cc, 1, 0);
    s.endShape();


    groupe.addChild(cFace);
    groupe.addChild(cDroite);
    groupe.addChild(cGauche);
    groupe.addChild(cFaceExt);
    groupe.addChild(cOpposit);
    groupe.addChild(cOppositExt);
    groupe.addChild(cSol);
    groupe.addChild(cHExt);
    groupe.addChild(s);

    return groupe;
  }
  
  
  public PShape getMurShape(){
    return this.murs;
  }
}
