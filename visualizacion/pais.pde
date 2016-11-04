class Pais {
  //Community and traditional health workers density (per 10 000 population)
  //Dentistry personnel density (per 10 000 population)
  //Environment and public health workers density (per 10 000 population)
  //External resources for health as percentage of total expenditure on health
  //General government expenditure on health as percentage of total expenditure on health
  //General government expenditure on health as percentage of total government expenditure
  //Hospital beds (per 10 000 population)
  //Laboratory health workers density (per 10 000 population)
  //Number of community and traditional health workers
  //Number of dentistry personnel
  //Number of environment and public health workers
  //Number of laboratory health workers
  //Number of nursing and midwifery personnel
  //Number of other health service providers
  //Number of pharmaceutical personnel
  //Number of physicians
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
  
  public String nombre;
  public int expectativaVida;
  public float porcentajeGastoSalud;
  
  public Pais(String nombre, int expectativaVida, float porcentajeGastoSalud) {
    this.nombre = nombre;
    this.expectativaVida = expectativaVida;
    this.porcentajeGastoSalud = porcentajeGastoSalud;
  }
  
  public String toString() {
    return nombre+", EV: "+expectativaVida+", PGS: "+porcentajeGastoSalud;
  }
}