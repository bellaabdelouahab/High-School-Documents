package Exemple1;

import java.util.List;

public interface studentDao {
    public List<student> getAllStudents();
    public student getStudent(int rollNo);
    public void updateStudent(student eleve);
    public void deleteStudent(student eleve);
}
