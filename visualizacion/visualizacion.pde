Table dataset; //<>// //<>// //<>// //<>// //<>// //<>//
Table codigos;
int renglon = 30;
PFont letra;
int x = 0, y = 300;
PShape mundo;
PShape paisActual;
void setup() {
  size(1000, 600);
  background(255);
  dataset = loadTable("WHO.csv", "header");
  codigos = loadTable("Codigos.csv", "header");
  mundo = loadShape("world.svg");  
  letra = createFont("SansSerif", 48);
  textFont(letra, 30);
  fill(0);
  text(dataset.getRowCount() + " total rows in table", 20, renglon);
  renglon = renglon + 30;
}
void draw() {
  background(255);
  fill(255);
  stroke(0);
  mundo.disableStyle();
  shape(mundo, 0, 0, width, height);
  x = 0;
  for (TableRow row : dataset.rows()) {   
    String pais = row.getString("Country");
    String codigo = "";
    for(TableRow fila : codigos.rows()) {
      String nombre = fila.getString("Common Name");
      if(nombre.equals(pais)) {
        codigo = fila.getString("ISO 3166-1 2 Letter Code");
        break;
      }
    }
    noStroke();
    if ((mouseX>x*6)&&(mouseX<x*6+4)&&
      (mouseY>580)&&(mouseY<600)) {
      fill(255, 0, 0);
      text(pais, x*6, 560);
      paisActual = mundo.getChild(codigo);
      if(paisActual!=null) {
        paisActual.disableStyle();
        fill(255,0,0);
        noStroke();
        shape(paisActual, 0, 0, width, height);
      }
    } else {
      fill(180);
    }
    rect(x*6, 580, 4, 20);    
    renglon = renglon + 30;
    x = x + 1;
  }
}