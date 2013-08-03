part of dartman;

class Dartman extends Entity{
  int x, y;
  
  Dartman(int i, int j) : super(i, j){
    this.x = this.gridI * 40;
    this.y = this.gridJ * 40;
    window.onKeyDown.listen(this.onPressed);
  }
  
  //-1 parado
  //0 baixo
  //1 cima
  //2 esquerda
  //3 direita
  
  int _direction = -1; 
  
  void onPressed(KeyboardEvent e){
    if(e.keyCode == KeyCode.DOWN){
      _direction = 0;
    } else if(e.keyCode == KeyCode.UP){
      _direction = 1;
    } else if(e.keyCode == KeyCode.LEFT){
      _direction = 2;
    } else if(e.keyCode == KeyCode.RIGHT){
      _direction = 3;
    }
  }
  
  void update(){
    int oldX = x;
    int oldY = y;
    int oldI = this.gridI;
    int oldJ = this.gridJ;
    
    if(_direction == 0){
      y += 2;
    } else if(_direction == 1){
      y -= 2;
    } else if(_direction == 2){
      x -= 2;
    } else if(_direction == 3){
      x += 2;
    }
    
    int newI = ((y+20)/40).toInt();
    int newJ = ((x+20)/40).toInt();
    
    //Se colidiu, desfazemos a movimentacao
    if(!parentGame.gameMap.canMove(newI, newJ)){
      this.gridI = oldI;
      this.gridJ = oldJ;
      this.x = oldX;
      this.y = oldY;
    }
  }
  
  void draw(CanvasRenderingContext2D context){
    context.fillStyle = "#f00";
    context.fillRect(x, y, 40, 40);
  }
}