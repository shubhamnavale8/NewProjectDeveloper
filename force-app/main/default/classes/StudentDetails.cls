public class StudentDetails {
    public String name;
    public Integer subject1;
    public Integer subject2;
    public Integer subject3;
    StudentDetails(){}
    StudentDetails(String name, Integer subject1, Integer subject2, Integer subject3){
        this.name = name;
        this.subject1 = subject1;
        this.subject2 = subject2;
        this.subject3 = subject3;
    }
    public static StudentDetails  setter(String name, Integer subject1, Integer subject2, Integer subject3){
        StudentDetails student = new StudentDetails(name, subject1, subject2, subject3);
        return student;
    }
    public Decimal calculateAverage() {
        Decimal totalMarks = (Decimal) subject1 + subject2 + subject3;
        return totalMarks / 3;
    }
     public static StudentDetails findStudentWithHighestAverage(StudentDetails[] students) {
        StudentDetails highestScorer = students[0];
        Decimal highestAverage = highestScorer.calculateAverage();
        for (Integer i = 1; i < students.size(); i++) {
            Decimal currentAverage = students[i].calculateAverage();
            if (currentAverage > highestAverage) {
                highestAverage = currentAverage;
                highestScorer = students[i];
            }
        }
        return highestScorer;
    }
    public static Decimal calculateAverageOfAverages(StudentDetails[] students) {
        Decimal totalAverages = 0;
        for (StudentDetails student : students) {
            totalAverages += student.calculateAverage();
        }
        return totalAverages / students.size();
    }
    public static void display(){
        
        StudentDetails[] students = new StudentDetails[10];
        students[0] = StudentDetails.setter('shubham',67,89,66);
        students[1] = StudentDetails.setter('Savin',61,29,64);
        students[2] = StudentDetails.setter('Abhishek',89,99,56);
        students[3] = StudentDetails.setter('Abdul',23,29,66);
        students[4] = StudentDetails.setter('Pooja',34,49,76);
        students[5] = StudentDetails.setter('Pratik',45,85,26);
        students[6] = StudentDetails.setter('Akshay',56,81,66);
        students[7] = StudentDetails.setter('Harshya',67,88,46);
        students[8] = StudentDetails.setter('Shekhar',8,30,56);
        students[9] = StudentDetails.setter('Sushant',100,99,96);
       
        // Find the student with the highest average
        StudentDetails highestAverageStudent = StudentDetails.findStudentWithHighestAverage(students);
        System.debug('Student with the highest average: ' + highestAverageStudent.name);
        // Calculate and print the average of all students' averages
        Decimal averageOfAverages = StudentDetails.calculateAverageOfAverages(students);
        System.debug('Average of all students\' averages: ' + averageOfAverages);
    }
}

//StudentDetails.display();
