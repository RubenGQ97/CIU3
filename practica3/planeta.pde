class planeta{
  
  
  HashMap<Integer,satelite> satelites;
  float radio,orbita,distancia,angulo;
  int id;
  PVector v1;
  String nombre;
  PImage textura;
  PShape esfera;
  boolean sat;
  String name;
  
  
  public planeta(float radio, float angulo,float orbita,float distancia, int id, int opcion,String name){
    noFill();
    this.nombre=name;
    esfera = createShape(SPHERE, radio);
    v1=new PVector(0,0,1);
    this.radio=radio;
    this.angulo= angulo;
    this.id=id;
    this.orbita=orbita;
    this.distancia=distancia;
    v1.mult(distancia);
    setTextura(opcion);
    satelites = new HashMap<Integer,satelite>();
    sat=false;
    
  }
  
  
  void setTextura(int n){
    
      switch(n){
        case 0 : textura=loadImage("arena.jpg");
              esfera.setTexture(textura);
        break;
        case 1 : textura=loadImage("agua.jpg");
              esfera.setTexture(textura);
        break;
        case 2 : textura=loadImage("tierra.jpg");
            esfera.setTexture(textura);
        break;
        case 3 : textura=loadImage("marte.jpg");
            esfera.setTexture(textura);
        break;
        case 4 : textura=loadImage("jupiter.jpg");
            esfera.setTexture(textura);
        break;
        case 5 : textura=loadImage("arena.jpg");
              esfera.setTexture(textura);
        break;
        case 6 : textura=loadImage("sol.jpg");
            esfera.setTexture(textura);
        break;
      }
      
      
  }
  
  
  int getId(){
  return id;
  }
  
  satelite getSatelite(int i){
      return satelites.get(i);
  }
  
  void anadirSatelite( satelite nuevo){
    sat=true;
    satelites.put(nuevo.getId(),nuevo);
  }
  
  
  void actualizar(){
  angulo+=orbita; 
    
  
    
  }
  
  void dibujaPlaneta(){
    pushMatrix();
  PVector v2= new PVector(1,0,1);
  PVector p = v1.cross(v2);
    rotate(angulo,p.x,p.y,p.z);
    stroke(255);    
    translate(v1.x,v1.y,v1.z);
    fill(255);
    shape(esfera);
    if(sat){
      for (HashMap.Entry<Integer, satelite> entry : satelites.entrySet()) {
          entry.getValue().actualizar();
         entry.getValue().dibujaPlaneta();
      }
    }
    textSize(40);
    text(nombre, radio/3,radio*2);
    
    popMatrix();
  }
}
