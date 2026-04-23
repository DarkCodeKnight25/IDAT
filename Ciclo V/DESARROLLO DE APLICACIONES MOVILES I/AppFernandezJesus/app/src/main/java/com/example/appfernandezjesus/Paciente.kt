package com.example.appfernandezjesus

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "tblpaciente")  // Nombre de la tabla en la base de datos
data class Paciente(
    @PrimaryKey val codpaciente: String,  // El código del paciente será la clave primaria
    val password: String,  // Contraseña del paciente
    val nombreapellido: String,  // Nombre y apellido del paciente
    val celular: String  // Número de celular del paciente
)