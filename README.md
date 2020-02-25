# Sistema planetario
Practica 3 de CIU
# CIU - Práctica 3
# Rubén García Quintana

## Visualización de sistema planetario.

Esta practica consiste en utilizar lo aprendido sobre tranformaciones de elementos 3D para realizar el diseño de un sistema planetario.

Aqui podemos ver un gif con una pequeña demostración de su ejecución. 

![](gifplanetas.gif)


### Desarrollo de la práctica

Para la realización de esta practica, se creado distintas clases, una general llamada "sistema" que acogera los distintos elementos del sistema planetario, representados haciendo uso de las clase "planeta" y "satelite". 
```
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
```

```
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
```



Estas clases se encargan de crear los diferentes objetos PShape y de actualizar sus posiciones usando los metodos PushMatriz y popMatrix explicados en el guion de prácticas, tal como aparece en el siguiente codigo:

```
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


```

Para dar la textura a los diferentes elementos se ha usado la clase PImage que nos permite usar images guardadas en la carpeta data para aplicarlas a los objetos PShape. En nuestro caso, según la textura que queramos.

```
  PImage textura
  
  .
  .
  .


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
```



