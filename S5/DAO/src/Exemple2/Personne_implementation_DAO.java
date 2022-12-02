package Exemple2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Personne_implementation_DAO implements Personne_interface_dao{
    List<Personne> people = new ArrayList<Personne>();
    private Connection con;
    @Override
    public List<Personne> getPeople(){
        PreparedStatement ps;
        ResultSet result;
        con=Connect_db.getConnection();
        try{
            ps= con.prepareStatement("select * from personne");
            result=ps.executeQuery();
            while (result.next()){
                people.add(new Personne(result.getInt(1),result.getString(2),result.getString(3)));
            }}catch(SQLException e){e.printStackTrace();}
        return people;
    };
    @Override
    public Personne getPersonne(int id){
        Personne people=null;
        con = Connect_db.getConnection();
        try {
            PreparedStatement ps=con.prepareStatement("select * from personne where id=?");
            ps.setInt(1,id);
            ResultSet result =ps.executeQuery();
            while (result.next()) {
                people = new Personne(id,result.getString("nom"),result.getString("prenom"));
            }}catch (SQLException e){e.printStackTrace();}
        return people;
    };
    @Override
    public void updatePersonne(Personne p){
        con=Connect_db.getConnection();
        try{
            PreparedStatement ps=con.prepareStatement("UPDATE personne SET nom=?,prenom=? WHERE id=?");
            ps.setString(1,p.getNom());
            ps.setString(2,p.getPrenom());
            ps.setInt(3,p.getId());
        }catch (SQLException sqlException){sqlException.printStackTrace();}
    };
}
