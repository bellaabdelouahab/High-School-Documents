package Exemple1;

public class student {
    private String name;
    private int rollNo;

    public student(String nom,int no){
        name=nom;
        rollNo=no;
    }

    // SETTER
    public void setName(String name){
        this.name=name;
    }

    public void setRollNo(int rollNo){
        this.rollNo=rollNo;
    }

    // GETTER
    public String getName(){
        return this.name;
    }

    public int getRollNo(){
        return rollNo;
    }
}
