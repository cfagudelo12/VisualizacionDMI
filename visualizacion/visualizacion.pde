Table dataset; //<>//
Pais[] paises;
PFont letra;
int x = 0;
int y = 300;
int contador = 0;
int margin = 100;
int pshapes = 80;
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
  smooth(); //<>//
  size(1820, 980);
  background(255);
  cargarIconos();
  dibujarIconos();
  //letra = createFont("SansSerif", 48);
  //textFont(letra, 30);
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
    PShape shape = loadShape(nombre+".svg");
    paises[c]=new Pais(codigo,nombre,expectativaVida,porcentajeGastoSalud,densidadMedicos,densidadDentistas,densidadEnfermeras,densidadFarmacias,shape);
    c++;
  }
}

void draw() {
  background(255);
  dibujarIconos();
  shape(paises[contador].shape,0,0);
  if(mouseX>=0&&mouseX<=width/2&&mouseY>=0&&mouseY<=height/2) {
  } else if(mouseX>width/2&&mouseX<=width&&mouseY>=0&&mouseY<=height/2) {
  } else if(mouseX>=0&&mouseX<=width/2&&mouseY>height/2&&mouseY<=height) {
  } else if(mouseX>width/2&&mouseX<=width&&mouseY>height/2&&mouseY<=height) {
  }
}

void cargarIconos() {
  enfermeras = loadShape("nurse.svg");
  farmacias = loadShape("pill-and-tablet.svg");
  medicos = loadShape("stethoscope.svg");
  dentistas = loadShape("tooth-with-braces.svg");
}

void mouseClicked() {
  contador++;
}

void dibujarIconos() {
  shape(enfermeras,margin,margin,pshapes,pshapes);
  shape(farmacias,width-2*margin,margin,pshapes,pshapes);
  shape(medicos,margin,height-2*margin,pshapes,pshapes);
  shape(dentistas,width-2*margin,height-2*margin,pshapes,pshapes);
}