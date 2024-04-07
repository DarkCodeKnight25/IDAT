package pe.edu.pe.DAWII_CL2_XXX.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.edu.pe.DAWII_CL2_XXX.model.bd.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
    Usuario findByEmail(String email);

    Usuario findByNomusuario(String nomusuario);
}
