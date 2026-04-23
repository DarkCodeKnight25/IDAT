package com.example.appfernandezjesus

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.appfernandezjesus.databinding.FragmentUsuariosBinding
import kotlinx.coroutines.launch

class UsuariosFragment : Fragment() {

    private lateinit var binding: FragmentUsuariosBinding
    private lateinit var userAdapter: UserAdapter

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentUsuariosBinding.inflate(inflater, container, false)
        binding.recyclerView.layoutManager = LinearLayoutManager(requireContext())

        // Llamada a la API para obtener los usuarios
        lifecycleScope.launch {
            val response = RetrofitInstance.api.getUsers()
            userAdapter = UserAdapter(response)
            binding.recyclerView.adapter = userAdapter
        }

        return binding.root
    }
}