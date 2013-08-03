part of dartman;

class Tile{
  Sprite tileImage;
  
  Tile(this.tileImage);

  void draw(CanvasRenderingContext2D ctx, int i, int j){
    ctx.fillRect(j*40, i*40, 40, 40);
    ctx.drawImage(tileImage.element, j*40, i*40);
  }
}