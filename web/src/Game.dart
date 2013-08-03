part of dartman;

class Game{
  
  GameMap gameMap;
  
  CanvasElement backgroundCanvas;
  CanvasElement gameCanvas;

  CanvasRenderingContext2D backgroundContext;
  CanvasRenderingContext2D gameContext;
  
  Map<int, Entity> _entities = new Map();
  
  void init(){
    gameMap = new GameMap();
    backgroundCanvas = query("#background");
    gameCanvas = query("#game");
    
    backgroundContext = backgroundCanvas.context2D;
    gameContext = gameCanvas.context2D;
  }
  
  void addEntity(Entity e){
    e.parentGame = this;
    _entities[e.id] = e;
  }
  
  void removeEntity(Entity e){
    _entities.remove(e.id);
  }

  void update(){
    for(int key in _entities.keys){
      _entities[key].update();
    }
  }
  
  void start(){
    _requestAnimationFrame();
  }
  
  void _requestAnimationFrame(){
    window.requestAnimationFrame((num time){
      this.runLoop(time);
    });    
  }
  
  void runLoop(num time){
    update();
    draw();
    _requestAnimationFrame();
  }
  
  void draw(){
    //Limpa o canvas do game
    var rect = this.backgroundCanvas.client;
    CanvasRenderingContext2D context = this.gameContext;
    context.clearRect(0, 0, rect.width, rect.height);
    
    //Desenha o background
    gameMap.draw(this.backgroundContext);
    
    //Desenha as entidades
    for(int key in _entities.keys){
      _entities[key].draw(this.gameContext);
    }
  }
}