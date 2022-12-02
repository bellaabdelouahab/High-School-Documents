package Exemple2;

public class Dao_pattern_main {
    public static void main(String[] args) {
        Personne_implementation_DAO p = new Personne_implementation_DAO();
        for (Personne i :p.getPeople()){
           System.out.println("Personne N : "+i.getId()+", Name : "+i.getNom()+", prenom : "+i.getPrenom());
            System.out.println(i);
        }
        System.out.println(p.getPersonne(2));
    }
}
