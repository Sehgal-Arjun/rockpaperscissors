class Object{
  PImage image;
  char type;
  float x;
  float y;
  float xVel;
  float yVel;
  int closestScissors;
  int closestRock;
  int closestPaper;
  int maxx = width;
  int maxy = height;
  
  
  Object(){
    x= random(maxx/8, (3*maxx)/3.5);
    y = random(maxy/8, (3*maxy)/3.5);
    int num = int(random(0, 3));
    if (num == 1){
      type = 'r';
      image = loadImage("rock.png");
    }
    else if (num == 2){
      type = 'p';
      image = loadImage("paper.png");
    }
    else{
      type = 's';
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
  float getXVel(){
    return xVel;
  }
  float getYVel(){
    return yVel;
  }
  char getType(){
   return type; 
  }
  
  int getClosest(char type){
    if (type == 's'){
      return closestScissors;
    } 
    else if (type == 'p'){
      return closestPaper;
    }
    else{
      return closestRock;
    }
  }
  
  void setClosest(char type, int num){
    if (type == 's'){
      closestScissors = num;
    } 
    else if (type == 'p'){
      closestPaper = num;
    }
    else{
      closestRock = num;
    } 
  }
  
  void update(){
    if (x + xVel > maxx - 50){
      xVel = xVel * -1;
    }
    if (y + yVel > maxy - 50){
      yVel = yVel * -1;
    }
    if (x - abs(xVel) < 50){
      xVel = -1 * xVel;  
    }
    if (y - abs(yVel) < 50){
      yVel = -1 * yVel;
    }
    
    x = x + xVel;
    y = y + yVel;
    
  }
  
  void setVelocity(float xvelocity, float yvelocity){
    xVel = xvelocity;
    yVel = yvelocity;
  }
  
  void switchToPaper(){
    type = 'p';
    image = loadImage("paper.png");
  }
  void swtichToScissors(){
    type = 's';
    image = loadImage("scissors.png");
  }
  void switchToRock(){
    type = 'r';
    image = loadImage("rock.png");
  }  
}
