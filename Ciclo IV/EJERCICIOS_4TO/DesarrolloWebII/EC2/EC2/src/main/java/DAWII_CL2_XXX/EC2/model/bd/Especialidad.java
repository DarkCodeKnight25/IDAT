package DAWII_CL2_XXX.EC2.model.bd;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Entity
@Data
@Table(name = "especialidad")
public class Especialidad {
    @Id
    private Integer idesp;
    @Column(name = "nomesp")
    private String nomesp;
    @Column(name = "costo")
    private String costo;
}
