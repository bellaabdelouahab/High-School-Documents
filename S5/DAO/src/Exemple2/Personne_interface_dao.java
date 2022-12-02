package Exemple2;

import java.util.List;

public interface Personne_interface_dao {
    List<Personne> getPeople();
    Personne getPersonne(int id);
    public void addPersonne(Personne p);
    public void updatePersonne(Personne p);
}
