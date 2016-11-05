Table dataset; //<>// //<>// //<>// //<>// //<>// //<>//
Pais[] paises;
int renglon = 30;
PFont letra;
int x = 0, y = 300;
PShape mundo;
PShape paisActual;
void setup() {
  size(1000, 600);
  background(255);
  mundo = loadShape("world.svg");  
  letra = createFont("SansSerif", 48);
  textFont(letra, 30);
  fill(0);
  text(dataset.getRowCount() + " total rows in table", 20, renglon);
  renglon = renglon + 30;
  dataset = loadTable("WHO.csv", "header");
  paises = new Pais[dataset.getRowCount()];
  int c = 0;
  for (TableRow row : dataset.rows()) {
    String codigo = row.getString("ISO 3166-1 2 Letter Code");
    String nombre = row.getString("Country");
    int expectativaVida = row.getInt("Life expectancy at birth (years) both sexes");
    float porcentajeGastoSalud = row.getFloat("Total expenditure on health as percentage of gross domestic product");
    paises[c]=new Pais(codigo,nombre,expectativaVida,porcentajeGastoSalud);
    c++;
  }
}
void draw() {
  background(255);
  fill(255);
  stroke(0);
  mundo.disableStyle();
  shape(mundo, 0, 0, width, height);
  x = 0;
  for (int i = 0; i < paises.length; i++) {   
    noStroke();
    if ((mouseX>x*6)&&(mouseX<x*6+4)&&
      (mouseY>580)&&(mouseY<600)) {
      fill(255, 0, 0);
      text(paises[i].nombre, x*6, 560);
      paisActual = mundo.getChild(paises[i].codigo);
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