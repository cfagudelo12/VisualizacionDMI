Table dataset; //<>//
Pais[] paises;
int margin = 100;
int pshapes = 80;
int baseMargin = 50;
int multiplier = 3;
//Icon made by Freepik from www.flaticon.com 
PShape enfermeras;
//Icon made by Freepik from www.flaticon.com 
PShape farmacias;
//Icon made by Freepik from www.flaticon.com 
PShape medicos;
//Icon made by Freepik from www.flaticon.com 
PShape dentistas;
float avanceAngulo = 2*PI/14;
void setup() {
  smooth(); //<>//
  size(1820, 980);
  background(255);
  cargarIconos();
  dibujarIconos();
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
  if(mouseX>=0&&mouseX<=width/2&&mouseY>=0&&mouseY<=height/2) {
    dibujarPaisesEnfermeras();
  } else if(mouseX>width/2&&mouseX<=width&&mouseY>=0&&mouseY<=height/2) {
    dibujarPaisesFarmacias();
  } else if(mouseX>=0&&mouseX<=width/2&&mouseY>height/2&&mouseY<=height) {
    dibujarPaisesMedicos();
  } else if(mouseX>width/2&&mouseX<=width&&mouseY>height/2&&mouseY<=height) {
    dibujarPaisesDentistas();
  }
}

void cargarIconos() {
  enfermeras = loadShape("nurse.svg");
  farmacias = loadShape("pill-and-tablet.svg");
  medicos = loadShape("stethoscope.svg");
  dentistas = loadShape("tooth-with-braces.svg");
}

void dibujarIconos() {
  shape(enfermeras,margin,margin,pshapes,pshapes);
  shape(farmacias,width-2*margin,margin,pshapes,pshapes);
  shape(medicos,margin,height-2*margin,pshapes,pshapes);
  shape(dentistas,width-2*margin,height-2*margin,pshapes,pshapes);
}

void dibujarPaisesEnfermeras() {
  float angulo = 0;
  for(int i = 0; i < paises.length; i++) {
    //if(angulo>=0&&angulo<=PI/2) {
    //} else if(angulo>PI/2&&angulo<=PI) {
    //} else if(angulo>PI&&angulo<3*PI/4) {
    //} else {
    //}
    println(paises[i].densidadEnfermeras);
    float x = baseMargin+paises[i].densidadEnfermeras*multiplier;
    float y = baseMargin+paises[i].densidadEnfermeras*multiplier;
    shape(paises[i].shape, mouseX+x*cos(angulo), mouseY+y*sin(angulo),100,100);
    angulo+=avanceAngulo;
  }
}

void dibujarPaisesMedicos() {
  float angulo = 0;
  for(int i = 0; i < paises.length; i++) {
    //if(angulo>=0&&angulo<=PI/2) {
    //} else if(angulo>PI/2&&angulo<=PI) {
    //} else if(angulo>PI&&angulo<3*PI/4) {
    //} else {
    //}
    float x = baseMargin+paises[i].densidadMedicos*multiplier;
    float y = baseMargin+paises[i].densidadMedicos*multiplier;
    shape(paises[i].shape, mouseX+x*cos(angulo), mouseY+y*sin(angulo),100,100);
    angulo+=avanceAngulo;
  }
}

void dibujarPaisesFarmacias() {
  float angulo = 0;
  for(int i = 0; i < paises.length; i++) {
    //if(angulo>=0&&angulo<=PI/2) {
    //} else if(angulo>PI/2&&angulo<=PI) {
    //} else if(angulo>PI&&angulo<3*PI/4) {
    //} else {
    //}
    float x = baseMargin+paises[i].densidadFarmacias*multiplier;
    float y = baseMargin+paises[i].densidadFarmacias*multiplier;
    shape(paises[i].shape, mouseX+x*cos(angulo), mouseY+y*sin(angulo),100,100);
    angulo+=avanceAngulo;
  }
}

void dibujarPaisesDentistas() {
  float angulo = 0;
  for(int i = 0; i < paises.length; i++) {
    //if(angulo>=0&&angulo<=PI/2) {
    //} else if(angulo>PI/2&&angulo<=PI) {
    //} else if(angulo>PI&&angulo<3*PI/4) {
    //} else {
    //}
    float x = baseMargin+paises[i].densidadDentistas*multiplier;
    float y = baseMargin+paises[i].densidadDentistas*multiplier;
    shape(paises[i].shape, mouseX+x*cos(angulo), mouseY+y*sin(angulo),100,100);
    angulo+=avanceAngulo;
  }
}