public Object[] objects = new Object[50];
int radius = 30;

void setup(){
  //background(0);
  size(800, 800);
  for (int i = 0; i < objects.length; i++){
    objects[i] = new Object();
    if (objects[i].getType() == 's'){
      objects[i].setClosest('s', i);
    }
    else if (objects[i].getType() == 'p'){
      objects[i].setClosest('p', i);
    }
    else{
      objects[i].setClosest('r', i);
    }  
  }
}

void draw(){
  frameRate(1000000000);
  smooth();
  background(0);
  for (int i = 0; i < objects.length; i++)
  {
    for (int j = 0; j < objects.length; j++)
    {
      if (i != j){
        if (objects[i].getType() == 'r' && objects[j].getType() == 's'){ // if you are a rock and that is a scissor
          float currentdistance = abs(dist(objects[i].getX(), objects[i].getY(), objects[j].getX(), objects[j].getY()));
          float closestdistance = abs(dist(objects[i].getX(), objects[i].getY(), objects[objects[i].getClosest('s')].getX(), objects[objects[i].getClosest('s')].getY()));
          if (currentdistance < closestdistance){
            objects[i].setClosest('s', j);
          }
          float xvel = (objects[objects[i].getClosest('s')].getX()-objects[i].getX()) / (abs(objects[objects[i].getClosest('s')].getX()-objects[i].getX()) * 50);
          float yvel = (objects[objects[i].getClosest('s')].getY()-objects[i].getY()) / (abs((objects[objects[i].getClosest('s')].getY()-objects[i].getY())) * 50);
          if (!Float.isNaN(xvel) && !Float.isNaN(yvel)){
            objects[i].setVelocity(xvel + random(-0.08, 0.08), yvel + random(-0.08, 0.08));
          }
        }
        else if (objects[i].getType() == 's' && objects[j].getType() == 'p'){
          float currentdistance = abs(dist(objects[i].getX(), objects[i].getY(), objects[j].getX(), objects[j].getY()));
          float closestdistance = abs(dist(objects[i].getX(), objects[i].getY(), objects[objects[i].getClosest('p')].getX(), objects[objects[i].getClosest('p')].getY()));
          if (currentdistance < closestdistance){
            objects[i].setClosest('p', j);
          }
          float xvel = (objects[objects[i].getClosest('p')].getX()-objects[i].getX()) / (abs(objects[objects[i].getClosest('p')].getX()-objects[i].getX()) * 50);
          float yvel = (objects[objects[i].getClosest('p')].getY()-objects[i].getY()) / (abs((objects[objects[i].getClosest('p')].getY()-objects[i].getY())) * 50);
          if (!Float.isNaN(xvel) && !Float.isNaN(yvel)){
            objects[i].setVelocity(xvel + random(-0.08, 0.08), yvel + random(-0.08, 0.08));
          }
        }
        else if (objects[i].getType() == 'p' && objects[j].getType() == 'r'){
          float currentdistance = abs(dist(objects[i].getX(), objects[i].getY(), objects[j].getX(), objects[j].getY()));
          float closestdistance = abs(dist(objects[i].getX(), objects[i].getY(), objects[objects[i].getClosest('r')].getX(), objects[objects[i].getClosest('r')].getY()));
          if (currentdistance < closestdistance){
            objects[i].setClosest('r', j);
          }
          float xvel = (objects[objects[i].getClosest('r')].getX()-objects[i].getX()) / (abs(objects[objects[i].getClosest('r')].getX()-objects[i].getX()) * 50);
          float yvel = (objects[objects[i].getClosest('r')].getY()-objects[i].getY()) / (abs(objects[objects[i].getClosest('r')].getY()-objects[i].getY()) * 50);
          if (!Float.isNaN(xvel) && !Float.isNaN(yvel)){
            objects[i].setVelocity(xvel + random(-0.08, 0.08), yvel + random(-0.08, 0.08));
          }
        }
      }
      else{
        objects[i].setVelocity(random(-0.1, 0.1), random(-0.1, 0.1));
      }

      
      
   
      if (abs(dist(objects[i].getX(), objects[i].getY(), objects[j].getX(), objects[j].getY())) < (radius))
      {
        if (objects[i].getType() == 'r' && objects[j].getType() == 'p')
        {
           objects[i].switchToPaper(); 
        }
        else if (objects[i].getType() == 'p' && objects[j].getType() == 's')
        {
           objects[i].swtichToScissors(); 
        }
        else if (objects[i].getType() == 's' && objects[j].getType() == 'r')
        {
           objects[i].switchToRock(); 
        }
      }
      objects[i].update();
    }
    image(objects[i].getImage(), objects[i].getX(), objects[i].getY(), radius, radius);
  }
  
  int numS = 0;
  int numP = 0;
  int numR = 0;
  for (Object o : objects){
    if (o.getType() == 's'){
      numS = numS + 1;
    }
    else if (o.getType() == 'r'){
      numR = numR + 1;
    }
    else{
      numP = numP + 1;
    }
  }
  if (numS == objects.length){
    print("scissors wins!");
    stop();
  }
  else if (numR == objects.length){
    print("rock wins!");
    stop();
  }
  else if (numP == objects.length){
    print("paper wins!");
    stop();
  }
}
