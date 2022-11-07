class Object{
  PImage image;
  char type;
  float x;
  float y;
  
  Object(){
    x = random(0, width);
    y = random(0, height);
    int num = int(random(0, 3));
    if (num == 1){
      type = 'r';
    }
    else if (num == 2){
      type = 'p';
    }
    else{
      type = 's';
    }
 
    if (type == 'r'){
       image = loadImage("rock.png");
    }
    else if (type == 'p'){
       image = loadImage("paper.png");
    }
    else{
       image = loadImage("scissors.png");
    }
  }
  
  PImage getImage(){
    return image;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y; 
  }
  char getType(){
   return type; 
  }
  
  void update(){
    float xChange = random(-3,3);
    float yChange = random(-3,3);
    if (x + xChange > width){
      x-= xChange;
    }
    else{
      x+=xChange;
    }
    if (y + yChange > height){
      y-= yChange;
    }
    else{
      y+=yChange;
    }
    if (x + xChange < 0){
      x+= abs(xChange);  
    }
    else{
      x+=xChange;
    }
    if (y + yChange < 0){
      y+= abs(yChange);
    }
    else{
      y+=yChange;
    }
  }
  
  void kill (char val){
    if (val == 'p'){
      image = loadImage("paper.png");
    }
  }
}
