package com.example.appfernandezjesus

import retrofit2.http.GET

interface ApiService {

    // Definir el endpoint para obtener los usuarios
    @GET("users")
    suspend fun getUsers(): List<User>  // Listado de usuarios
}