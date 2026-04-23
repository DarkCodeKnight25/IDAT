package com.example.appfernandezjesus

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import com.example.appfernandezjesus.databinding.FragmentCuentaBinding
import kotlinx.coroutines.launch

class CuentaFragment : Fragment() {

    private lateinit var binding: FragmentCuentaBinding  // Usando ViewBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflar el layout del fragmento
        binding = FragmentCuentaBinding.inflate(inflater, container, false)

        // Obtener el código del paciente autenticado (suponiendo que se guardó en una variable global o similar)
        val codPaciente = "123"  // Esto debe ser obtenido de alguna forma, como un login previo

        // Obtener el paciente de la base de datos
        lifecycleScope.launch {
            val pacienteDao = RetrofitInstance.getPacienteDao()  // Asegúrate de tener acceso al DAO
            val paciente = pacienteDao.getPacienteByCodigo(codPaciente)

            if (paciente != null) {
                // Mostrar la información del paciente
                binding.tvNombre.text = paciente.nombreapellido
                binding.tvCelular.text = paciente.celular
            } else {
                // Mostrar un mensaje si no se encontró al paciente
                binding.tvNombre.text = "Paciente no encontrado"
            }
        }

        return binding.root
    }
}