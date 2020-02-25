class satelite{
    
  float radio,orbita,distancia,angulo;
  int id;
  PVector v1;
  String nombre;
  PImage textura;
  PShape esfera;
  
  public satelite(float radio, float angulo,float orbita,float distancia, int id, String name){
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
    textura= loadImage("luna.jpg");

    
    
  }
  
  int getId(){
    return id;
  }
  
  String getname(){
    return nombre;
  }
  
  
  void dibujaPlaneta(){
    pushMatrix();
    noStroke();
  PVector v2= new PVector(1,0,1);
  PVector p = v1.cross(v2);
    rotate(angulo,p.x,p.y,p.z);
    stroke(255);    
    translate(v1.x,v1.y,v1.z);
    fill(255);
    shape(esfera);
    textSize(15);
    text(nombre, radio/3,radio*2);
    
    popMatrix();
    
  }
  
  
  
  void actualizar(){
  angulo+=orbita; 
  }
}
