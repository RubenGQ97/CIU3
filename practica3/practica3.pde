

PImage fondo;
sistema system;
float x,y,z;

void setup(){
  size(900,900,P3D);
    x=500;
    y=700;
    z=-1200;
  noStroke();
  fondo= loadImage("fondo.jpg");
  system= new sistema();
  system.anadirPlaneta(new planeta(30,random(0,TWO_PI),0.005,600,0,0,"planeta1"));
  system.anadirPlaneta(new planeta(40,random(0,TWO_PI),0.02,400,1,1,"planeta2"));
  system.anadirPlaneta(new planeta(55,random(0,TWO_PI),0.009,500,2,2,"planeta3"));
  system.anadirPlaneta(new planeta(40,random(0,TWO_PI),0.01,700,3,3,"planeta4"));
  system.anadirPlaneta(new planeta(100,random(0,TWO_PI),0.0093,1000,4,4,"planeta5"));
  system.anadirPlaneta(new planeta(200,0,0,0,6,6,"Estrella1"));
  planeta aux= system.getPlaneta(3);
  aux.anadirSatelite(new satelite(15.0,random(0,TWO_PI),0.0099,20,1,"Satelite 1"));
  aux=system.getPlaneta(4);
  aux.anadirSatelite(new satelite(20.0,random(0,TWO_PI),0.01,300,1,"Satelite 2"));
  aux.anadirSatelite(new satelite(15.0,random(0,TWO_PI),0.01,400,2,"Satelite 3"));
  
}

void draw(){
  fondo.resize(900,900);
  background(fondo);
  translate(x,y,z);
  system.mostrar();
  
}


void keyPressed(){
    if(keyCode==UP)z=z+10;
}
