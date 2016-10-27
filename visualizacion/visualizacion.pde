int NUM_CONTINENTES = 7;
int continenteSeleccionado = 1;
Table table;
Pais[][] paises;
float angulo = 0;
void setup() {
  size(1300,600);
  smooth();
  strokeWeight(3);
  textSize(16);
  fill(0);
  table = loadTable("WHO.csv", "header");
  int[] cuentaPaises = new int[NUM_CONTINENTES]; //<>//
  for (TableRow row : table.rows()) {
    int continente = row.getInt("Continent");
    cuentaPaises[continente-1]++;
  }
  paises = new Pais[NUM_CONTINENTES][]; //<>//
  for(int i = 0; i < NUM_CONTINENTES; i++) {
    paises[i] = new Pais[cuentaPaises[i]];
  }
  cuentaPaises = new int[NUM_CONTINENTES]; //<>//
  for (TableRow row : table.rows()) {
    int continente = row.getInt("Continent");
    String nombre = row.getString("Country");
    int expectativaVida = row.getInt("Life expectancy at birth (years) both sexes");
    float porcentajeGastoSalud = row.getFloat("Total expenditure on health as percentage of gross domestic product");
    paises[continente-1][cuentaPaises[continente-1]]=new Pais(nombre,expectativaVida,porcentajeGastoSalud);
    cuentaPaises[continente-1]++;
  }
  continenteSeleccionado = 0; //<>//
}

void draw() {
  background(255); //<>//
  float y = 0; //<>//
  float x = 0;
  float r = 0;
  float w = 0;
  float sen = 0;
  float mycolor = 0;
  for(int i = 0; i < paises[continenteSeleccionado].length; i++){
    y=280;
    r = map(paises[continenteSeleccionado][i].expectativaVida, 0, 100, 0, 300);
    if(Double.isNaN(paises[continenteSeleccionado][i].porcentajeGastoSalud)) {
      w = 1;
    } else {
      w = map(paises[continenteSeleccionado][i].porcentajeGastoSalud, 0, 17, 1, 10);
    }
    sen = map(sin(angulo),-1,1,0,2);
    y -= r*sen;
    mycolor = map(y,0,580,100,255);
    fill(255-mycolor);
    stroke(255-mycolor);
    angulo += 0.00005;
    rect(x,300+y,w,10);
    stroke(0);
    fill(0);
    line(x,580-r*2,x+w,580-r*2);
    if(mouseX>=x&&mouseX<=x+w&&mouseY>=580-r*2-2&&mouseY<=580-r*2+2) {
      text(paises[continenteSeleccionado][i].nombre, x, 580-r*2-2); 
    }
    x+=10;
  }
}