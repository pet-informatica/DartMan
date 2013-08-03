part of dartman;

abstract class Entity{
  static int _nextID = 0;
  
  Game parentGame;
  
  int id;
  int gridI, gridJ;
  
  Entity(this.gridI, this.gridJ){
    this.id = _nextID++;
  }
  
  void update();
  void draw(CanvasRenderingContext2D context);
}