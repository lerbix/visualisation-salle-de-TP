class Chaise {

  private int position;
  private color couleurChaise;
  private color couleurPieds;
  private PShape chaise;

  public Chaise(int position, color couleurChaise, color couleurPieds ) {
    this.position = position;
    this.couleurChaise = couleurChaise;
    this.couleurPieds = couleurPieds;
    this.chaise = dessinerChaise();
  }




  private PShape dessinerPieds(int x, int y, int z, int t_x, int t_y, int t_z) {
    PShape groupePieds= createShape(GROUP);

    PShape p1 = createShape(BOX, x, y, z);
    p1.setFill(color(0));

    PShape p2 = createShape(BOX, x, y, z);
    p2.setFill(color(0));

    p1.translate(t_x, t_y, t_z);
    p2.translate(-t_x, t_y, t_z);

    groupePieds.addChild(p1);
    groupePieds.addChild(p2);

    return groupePieds;
  }


  private PShape dessinerChaise() {
    PShape chaise= createShape(GROUP);
    
    PShape pied []= {
      dessinerPieds(8/position, 125/position, 8/position, 40/position, 40/position, -45/position),
      dessinerPieds(8/position, 125/position, 8/position, 40/position, 40/position, -45/position)
    };

    PShape chaiseSurface =  createShape(BOX, 90/position, 5/position, 120/position);
    PShape chaiseDos =  createShape(BOX, 5/position, 130/position, 120/position);
    chaiseSurface.translate(100/position, -25/position, 0);
    chaiseSurface.setFill(couleurChaise);
    chaiseDos.setFill(couleurChaise);
    chaiseDos.translate(145/position, -90/position, 0);
    chaise.addChild(chaiseSurface);
    chaise.addChild(chaiseDos);

    for (int i  = 0; i <pied.length; i++) {
      pied[i].translate(100/position, 0, 0);
      pied[i].setFill(couleurPieds);

      chaise.addChild(pied[i]);
      if (i%2==0)
        pied[i].translate(0, 0, 90/position);
    }
    chaise.translate(10/position, 100/position, -90/position);

    return chaise;
  }


  // Getters 
  public int getPosition() {
    return this.position;
  }
  
  public PShape getChaise() {
    return this.chaise;
  }
  
  public color getCouleurChaise() {
    return this.couleurChaise;
  }
  
  public color getCouleurPieds() {
    return this.couleurPieds;
  }
  
  
  
  
}
