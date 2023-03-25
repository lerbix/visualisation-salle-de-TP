class Bureau {


  private int position;
  private boolean isTwins;
  private boolean isProf;
  private PShape BureauShape;



  // COULEUR BUREAU
  private final color COULEUR_BUREAU_PRINCIPAL = color(#90e0ef);
  //color(142, 195, 201);
  private final color COULEUR_BUREAU_PIEDS= color(0);

  // COULEUR CHAISE
  private final color COULEUR_CHAISE_PRINCIPAL = color(#fca311);
  //color(183, 144, 4);
  private final color COULEUR_CHAISE_PIEDS= color(#FFF300);



  // COULEURS DES ACCESSOIRES DU BUREAU
  // COULEUR DE LA SOURIS
  private final color COULEUR_SOURIS = color(0);
  // COULEUR DE L'UNITE CENTRALE
  private final color COULEUR_UC = color(0);
  // COULEUR DU MONITEUR
  private final color COULEUR_MONITOR = color(0);
  // COULEUR DU support du MONITEUR 1
  private final color COULEUR_SUPP_MONITOR = color(100, 100, 98);
  private final color COULEUR_SUPP_MONITOR_2 = color(100, 100, 98);
  // COULEUR DU CLAVIER
  private final color COULEUR_CLAVIER = color(0);
  // COULEUR DU SUPPORT MONITOR 3
  private final color COULEUR_SUPP_MONITOR_3 = color(100, 100, 98);
  // IMAGE ECRAN MONITOR
  private final String NOM_IMAGE = "SALLEA106.png";


  public Bureau(int position, boolean isTwins, boolean isProf) {
    this.position = position;
    this.isTwins = isTwins;
    this.isProf = isProf;
    this.BureauShape = dessinerBureau();
  }


  private PShape dessinerBureau() {
    PShape groupe = createShape(GROUP);
    PShape pied []= {
    dessinerPieds(15/position, 200/position, 15/position, 60/position, 100/position, 160/position), dessinerPieds(15/position, 200/position, 15/position, 60/position, 100/position, 160/position)};
    Chaise c1 = new Chaise(position, COULEUR_CHAISE_PRINCIPAL, COULEUR_CHAISE_PIEDS);
    Chaise c2 = new Chaise(position, COULEUR_CHAISE_PRINCIPAL, COULEUR_CHAISE_PIEDS);

    ArrayList<PShape> chaises = new ArrayList();
    chaises.add(c1.getChaise());
    chaises.add(c2.getChaise());
    PShape chaise[] = {c1.getChaise(), c2.getChaise()};
    PShape surface = createShape(BOX, 150/position, 10/position, 350/position);
    surface.setFill(COULEUR_BUREAU_PRINCIPAL);

    groupe.addChild(surface);


    if (isProf) {
      for (PShape c : chaises) {
        groupe.addChild(c);
        c.translate(0, 0, 90/x);
      }
      for (int i  = 0; i <pied.length; i++) {
        groupe.addChild(pied[i]);
        if (i%2==0)
          pied[i].translate(0, 0, -320/x);
      }

      groupe.rotateY(-PI/2);
      groupe.translate(-280, 82, -60);
      return groupe;
    }

    PShape acc[] = {dessinerAccessoires(3), dessinerAccessoires(3)};

    for (int i  = 0; i <acc.length; i++) {
      groupe.addChild(acc[i]);
      groupe.addChild(chaise[i]);

      if (isTwins==true) {
        if (i%2==0) {
          acc[i].translate(0, 0, 180/x);
          chaise[i].translate(0, 0, 180/x);
        }
      } else {
        acc[i].translate(0, 0, 90/x);
        chaise[i].translate(0, 0, 90/x);
      }
    }
    for (int i  = 0; i <pied.length; i++) {
      groupe.addChild(pied[i]);
      if (i%2==0)
        pied[i].translate(0, 0, -320/x);
    }
    groupe.rotateY(PI/2);
    groupe.translate(-380, 82, -110);
    return groupe;
  }

  private PShape dessinerPieds(int x, int y, int z, int t_x, int t_y, int t_z) {
    PShape groupePieds= createShape(GROUP);
    PShape p1 = createShape(BOX, x, y, z);
    p1.setFill(COULEUR_BUREAU_PIEDS);
    PShape p2 = createShape(BOX, x, y, z);
    p2.setFill(COULEUR_BUREAU_PIEDS);
    p1.translate(t_x, t_y, t_z);
    p2.translate(-t_x, t_y, t_z);
    groupePieds.addChild(p1);
    groupePieds.addChild(p2);
    return groupePieds;
  }






  PShape dessinerAccessoires(int position) {
    AccessoiresBureau accessoiresBureau = new AccessoiresBureau();
    PShape groupeDesAccessoires = createShape(GROUP);

    // unite centrale
    PShape uniteCentrale = accessoiresBureau.uniteCentrale(position, COULEUR_UC);
    uniteCentrale.translate(-5/position, -33/position, -150/position);
    groupeDesAccessoires.addChild(uniteCentrale);

    // monitor
    PShape monitor = accessoiresBureau.monitor(position, COULEUR_MONITOR);
    monitor.translate(-5/position, -63/position, -60/position);
    groupeDesAccessoires.addChild(monitor);

    // support moniteur 1
    PShape suppMoniteur = accessoiresBureau.calEcran(position, COULEUR_SUPP_MONITOR );
    suppMoniteur.translate(-20/position, -34/position, -60/position);
    groupeDesAccessoires.addChild(suppMoniteur);

    // clavier
    PShape clavier = accessoiresBureau.clavier(position, COULEUR_CLAVIER);
    clavier.translate(40/position, -6/position, -60/position);
    groupeDesAccessoires.addChild(clavier);

    // support moniteur 2
    PShape suppMoniteur2 = accessoiresBureau.reposeCal(position, COULEUR_SUPP_MONITOR_2);
    suppMoniteur2.translate(-20/position, -6/position, -60/position);
    groupeDesAccessoires.addChild(suppMoniteur2);

    // caleLevierEcran
    PShape caleLevierEcran = accessoiresBureau.caleLevierEcran(position, COULEUR_SUPP_MONITOR_3);
    caleLevierEcran.translate(-15/position, -60/position, -60/position);
    groupeDesAccessoires.addChild(caleLevierEcran);

    // souris
    PShape souris = accessoiresBureau.souris(position, COULEUR_SOURIS);
    souris.translate(40/position, -5/position, -130/position);
    groupeDesAccessoires.addChild(souris);

    // ecran
    PShape ecranMonitor = accessoiresBureau.ecranMonitor(NOM_IMAGE);
    groupeDesAccessoires.addChild(ecranMonitor);


    return groupeDesAccessoires;
  }




  // Getters
  public PShape getBureauShape() {
    return this.BureauShape;
  }
}
