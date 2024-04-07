package pe.edu.idat.appwebventasidat.service;

import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pe.edu.idat.appwebventasidat.model.bd.Rol;
import pe.edu.idat.appwebventasidat.model.bd.Usuario;
import pe.edu.idat.appwebventasidat.repository.RolRepository;
import pe.edu.idat.appwebventasidat.repository.UsuarioRepository;

import java.util.Arrays;
import java.util.HashSet;

@Service
@AllArgsConstructor
public class UsuarioService {
    private UsuarioRepository usuarioRepository;

    private RolRepository rolRepository;

    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    public Usuario BuscarUsuariopPorEmail(String email){
        return  usuarioRepository.findByEmail(email);
    }
    public Usuario BuscarUsuarioPorNombreUsuario(String username){
        return usuarioRepository.findByNomusuario(username);
    }

    public Usuario guardarUsuario(Usuario usuario){
        usuario.setPassword(bCryptPasswordEncoder.encode(usuario.getPassword()));
        usuario.setActivo(true);
        Rol usuarioRol = rolRepository.findByNomrol(("ADMIN"));
        usuario.setRoles(new HashSet<>(Arrays.asList(usuarioRol)));
        return usuarioRepository.save(usuario);
    }
}
