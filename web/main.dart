import 'dart:html';

import 'Dartman.dart';

Game gameObject;

void main() {
  gameObject = new Game();
  gameObject.init();
  
  Dartman man = new Dartman(1, 1);
  gameObject.addEntity(man);
  
  gameObject.start();
}