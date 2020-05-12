
//importo la librería
import oscP5.*;
import netP5.*;

//este es el objeto que recibe
OscP5 oscP5;

//esta será la dirección donde voy a enviar mis mensajes
NetAddress direccionRemota;

int x, y;
int t = 10;
color circle;
color triangle;
color square;
int square_=0;
int circle_=0;
int triangle_=0;

void setup() {
  size(400, 400);
  //inicializo el objeto oscPs, el parámetro es el puerto donde va a escuchar los mensajes entrantes
  oscP5 = new OscP5(this, 12000);

  // inicializo el objeto NetAddress pasando la dirección IP y el puerto de los mensajes salientes
  // 127.0.0.1 es mi localhost
  //direccionRemota = new NetAddress("127.0.0.1", 12001); no se va a usar ya que solo vamos a recibir

  x = width/2;
  y = height/2;
  background(0);
}

void draw() {
    
  
  noStroke();
  //config del circulo

    if (circle_ == 0){
    circle= color(0,0,255);
    }
    if (circle_ == 1){
    circle= color(255,255,0);
    }
    if (circle_ == 2){
    circle= color(255,0,0);
    }
    if (circle_ == 3){
    circle_= 0;
    }
    
  fill(circle);
  circle(350, 180, 55);
  //config del triangle

    if (triangle_ == 0){
    triangle= color(255,255,0);
    }
    if (triangle_ == 1){
    triangle= color(255,0,0);
    }
    if (triangle_ == 2){
    triangle= color(0,0,255);
    }
    if (triangle_ == 3){
    triangle_= 0;
    }
    
  
  fill(triangle);
  triangle(100, 150, 50, 200, 150, 200);
  //config del cuadrado

  
    if (square_ == 0){
    square= color(255,0,0);
    }
    if (square_ == 1){
    square= color(0,0,255);
    }
    if (square_ == 2){
    square= color(255,255,0);
    }
    if (square_ == 3){
    square_= 0;
    }
    
  fill(square);
  square(200, 150, 55);
  
  
}


//cada vez que se recibe un mensaje de osc en el puerto asignado, se llama esta función
void oscEvent(OscMessage theOscMessage) {  
  //si el mensaje está etiquetado como "/x"
  if (theOscMessage.checkAddrPattern("/x") == true) {//cambia color del circulo
    triangle_++;
    
  }

  //si el mensaje está etiquetado como "/y"
  if (theOscMessage.checkAddrPattern("/y") == true) {
   square_++;
  }
  
   //si el mensaje está etiquetado como "/z"
  if (theOscMessage.checkAddrPattern("/z") == true) {
  circle_++;
  }
}
