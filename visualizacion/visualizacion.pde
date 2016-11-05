Table dataset; //<>// //<>// //<>// //<>// //<>// //<>//
Pais[] paises;
PFont letra;
int x = 0, y = 300;
PShape mundo;
PShape paisActual;
int modaExpectativaVida = 73;
void setup() {
  smooth();
  size(1820, 980);
  background(255);
  mundo = loadShape("world.svg");  
  letra = createFont("SansSerif", 48);
  textFont(letra, 30);
  fill(0);
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
  for (int i = 0; i < paises.length; i++) {   
    noStroke();
    paisActual = mundo.getChild(paises[i].codigo);
    if(paisActual!=null) {
      paisActual.disableStyle();
      fill(255);
      stroke(0);
      if(paises[i].expectativaVida!=0) {
        float scale = (float)paises[i].expectativaVida/modaExpectativaVida;
        paisActual.scale(scale);
      }
      shape(paisActual, 0, 0, width, height);
    }
  }
}