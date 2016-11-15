Table dataset; //<>//
Pais[] paises;
PFont letra;
int x = 0;
int y = 300;
int margin = 100;
int pshapes = 80;
PShape mundo;
PShape paisActual;
//Icon made by Freepik from www.flaticon.com 
PShape enfermeras;
//Icon made by Freepik from www.flaticon.com 
PShape farmacias;
//Icon made by Freepik from www.flaticon.com 
PShape medicos;
//Icon made by Freepik from www.flaticon.com 
PShape dentistas;
float radio = 2*PI/20;
void setup() {
  smooth();
  size(1820, 980);
  background(255);
  mundo = loadShape("world.svg");
  enfermeras = loadShape("nurse.svg");
  shape(enfermeras,margin,margin,pshapes,pshapes);
  farmacias = loadShape("pill-and-tablet.svg");
  shape(farmacias,width-margin,margin,pshapes,pshapes);
  medicos = loadShape("stethoscope.svg");
  shape(medicos,margin,height-margin,pshapes,pshapes);
  dentistas = loadShape("tooth-with-braces.svg");
  shape(dentistas,width-margin,height-margin,pshapes,pshapes);
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
    int densidadMedicos = row.getInt("Physicians density (per 10 000 population)");
    int densidadDentistas = row.getInt("Dentistry personnel density (per 10 000 population)");
    int densidadEnfermeras = row.getInt("Nursing and midwifery personnel density (per 10 000 population)");
    int densidadFarmacias = row.getInt("Pharmaceutical personnel density (per 10 000 population)");
    paises[c]=new Pais(codigo,nombre,expectativaVida,porcentajeGastoSalud,densidadMedicos,densidadDentistas,densidadEnfermeras,densidadFarmacias);
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
        float scale = 1;
        paisActual.scale(scale);
      }
      shape(paisActual, 0, 0, width, height);
    }
  }
}