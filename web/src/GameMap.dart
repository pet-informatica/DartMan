part of dartman;

class GameMap{
  var tileMap = [
               [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
               [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
               [1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1],
               [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
               [1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1],
               [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
               [1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1],
               [1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1],
               [1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1],
               [1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1],
               [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
               [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
               ];
  
  var tileTypes = [new Tile(new Sprite("assets/grama.bmp")),
                   new Tile(new Sprite("assets/parede.bmp"))];
  
  bool _hasBeenDraw = false;
  
  void draw(CanvasRenderingContext2D context){
    if(_hasBeenDraw) return;
    if(_loadedImages < 2) return;
        
    for(int i = 0; i < tileMap.length; i++){
      for(int j = 0; j < tileMap[i].length; j++){
        tileTypes[tileMap[i][j]].draw(context, i, j);
      }
    }
    _hasBeenDraw = true;
  }
  
  bool canMove(int i, int j){
    return tileMap[i][j] != 1;
  }
}