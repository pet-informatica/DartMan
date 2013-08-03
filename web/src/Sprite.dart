part of dartman;

int _loadedImages = 0;

class Sprite{
  ImageElement element;
  
  Sprite(String source){
    element = new ImageElement(src: source);
    element.onLoad.listen((e) {_loadedImages++;});
  }
}