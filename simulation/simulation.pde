public Object[] objects = new Object[100];

void setup(){
  size(1000,1000);
  for (int i = 0; i < objects.length; i++){
    objects[i] = new Object();
  }
}

void draw(){
  background(0);
  for (Object object: objects){
    image(object.getImage(), object.getX(), object.getY(), 30, 30);
    object.update();
  }
  for (int i = 0; i < objects.length; i++){
        for (int j = 0; j < i; j++){
            if (abs(objects[j].getX() - objects[i].getX()) <= 1 || abs(objects[j].getY() - objects[i].getY()) <= 60){
              if (objects[i].getType() == 'r' && objects[j].getType() == 'p'){
                 objects[j].kill('p'); 
              }
            }
        }
  }
  
  
}
