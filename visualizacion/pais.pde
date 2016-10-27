class Pais {
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