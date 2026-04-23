package com.example.appfernandezjesus

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity  // Cambiar a AppCompatActivity
import androidx.fragment.app.Fragment
import com.example.appfernandezjesus.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {  // Usar AppCompatActivity en lugar de ComponentActivity

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Configurar la navegación
        binding.bottomNavigation.setOnItemSelectedListener { item ->
            when (item.itemId) {
                R.id.fragment1 -> {
                    replaceFragment(UsuariosFragment())  // Navegar al fragmento de usuarios
                    true
                }
                R.id.fragment2 -> {
                    replaceFragment(CuentaFragment())  // Navegar al fragmento de cuenta
                    true
                }
                else -> false
            }
        }

        // Iniciar con el fragmento de usuarios
        replaceFragment(UsuariosFragment())
    }

    private fun replaceFragment(fragment: Fragment) {
        val transaction = supportFragmentManager.beginTransaction()  // Aquí está la solución
        transaction.replace(R.id.fragment_container, fragment)
        transaction.commit()
    }
}