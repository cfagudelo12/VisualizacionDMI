class Pais {
  //Dentistry personnel density (per 10 000 population)
  //Environment and public health workers density (per 10 000 population)
  //External resources for health as percentage of total expenditure on health
  //General government expenditure on health as percentage of total expenditure on health
  //General government expenditure on health as percentage of total government expenditure
  //Hospital beds (per 10 000 population)
  //Nursing and midwifery personnel density (per 10 000 population)
  //Other health service providers density (per 10 000 population)
  //Out-of-pocket expenditure as percentage of private expenditure on health
  //Per capita government expenditure on health (PPP int. $)
  //Per capita government expenditure on health at average exchange rate (US$)
  //Per capita total expenditure on health (PPP int. $)
  //Per capita total expenditure on health at average exchange rate (US$)
  //Pharmaceutical personnel density (per 10 000 population)
  //Physicians density (per 10 000 population)
  //Private expenditure on health as percentage of total expenditure on health
  //Private prepaid plans as percentage of private expenditure on health
  //Total expenditure on health as percentage of gross domestic product
  //Life expectancy at birth (years) both sexes
  //Healthy life expectancy (HALE) at birth (years) both sexes
  //Years of life lost to communicable diseases (%)
  //Years of life lost to injuries (%)
  //Years of life lost to non-communicable diseases (%)
  
  public String codigo;
  public String nombre;
  public int expectativaVida;
  public float porcentajeGastoSalud;
  public int densidadMedicos;
  public int densidadDentistas;
  public int densidadEnfermeras;
  public int densidadFarmacias;
  
  public Pais(String codigo, String nombre, int expectativaVida, float porcentajeGastoSalud, int densidadMedicos, int densidadDentistas, int densidadEnfermeras, int densidadFarmacias) {
    this.codigo = codigo;
    this.nombre = nombre;
    this.expectativaVida = expectativaVida;
    this.porcentajeGastoSalud = porcentajeGastoSalud;
    this.densidadMedicos = densidadMedicos;
    this.densidadDentistas = densidadDentistas;
    this.densidadEnfermeras = densidadEnfermeras;
    this.densidadFarmacias = densidadFarmacias;
  }
  
  public String toString() {
    return nombre+", EV: "+expectativaVida+", PGS: "+porcentajeGastoSalud;
  }
}