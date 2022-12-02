package Exemple1;

public class Dao_pattern {
    /**
     * @param args
     */
    public static void main(String[] args) {
        studentDao_implement std_dao = new studentDao_implement();

        // SHOW STUDENT
        for(student i : std_dao.getAllStudents()){
            System.out.println("Student N : "+i.getRollNo()+", Name : "+i.getName());
        }

        // UPDATE STUDENT
        student std = std_dao.getAllStudents().get(1);
        std.setName("khalid");
        std_dao.updateStudent(std);

        // GET STUDENT
        System.out.println(std_dao.getStudent(1));
    }
}
