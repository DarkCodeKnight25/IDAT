package com.example.appfernandezjesus

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitInstance {
    private const val BASE_URL = "https://jsonplaceholder.typicode.com/"

    // Crear la instancia de Retrofit
    val api: ApiService by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())  // Usamos Gson para la conversión
            .build()
            .create(ApiService::class.java)
    }
}