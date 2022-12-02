package Exemple1;

import java.util.ArrayList;
import java.util.List;

public class studentDao_implement implements studentDao{
    List<student> students = new ArrayList<student>();

    public studentDao_implement(){
        students.add(new student("yassine", 0));
        students.add(new student("khalid", 1));
    }

    public List<student> getAllStudents(){
        return this.students;
    };

    public student getStudent(int rollNo){
        return students.get(rollNo);
    };

    public void updateStudent(student eleve){
        students.get(eleve.getRollNo()).setName(eleve.getName());
        System.out.println("Student N : "+eleve.getRollNo()+" updated succefully");
    };

    public void deleteStudent(student eleve){
        students.remove(eleve.getRollNo());
        System.out.println("Student N : "+eleve.getRollNo()+" was deleting from DB");
    };
}
