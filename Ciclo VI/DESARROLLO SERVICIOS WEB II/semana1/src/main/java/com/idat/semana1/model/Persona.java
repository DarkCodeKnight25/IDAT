package com.idat.semana1.model;

public class Persona {

    private int idpersona;
    private String nombre;
    private String apellido;

    public Persona(){

    }

    public Persona(int idpersona, String nombre, String apellido) {
        this.idpersona = idpersona;
        this.nombre = nombre;
        this.apellido = apellido;
    } 
    
	public int getIdpersona() {
		return idpersona;
	}
	
	public void setIdpersona(int idpersona) {
		this.idpersona = idpersona;
	}
	
	public String getApellido() {
		return apellido;
	}
	
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
    
    
}
