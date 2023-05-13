@isTest
public class testStudentClass {
    
    @isTest
    public static void testStudentForSet(){
        StudentCourse studentObject=new StudentCourse();
        studentObject.setStudentAddress('Pune');
        studentObject.setStudentName('Shubham');
        studentObject.setStudentId(509);
        studentObject.setStudentFees(900000);
        studentObject.setStudentCourseFee(70000);
        Contact obj1=new Contact();
        Contact obj2=new Contact();
        obj1.LastName='Wick';
        obj2.LastName='Shinde';
        Test.startTest();
        for(Integer i=0; i<150; i++){
            Contact obj=new Contact();
            obj.LastName='Navale'+i;
            insert obj;
            
        }
         Test.stopTest();   
    }
    @isTest
    public static void testStudentForGet(){
      
        // System.assert(condition);
        // System.assertEquals(expected, actual);
        StudentCourse studentObject=new StudentCourse();
        studentObject.setStudentAddress('Pune');
        studentObject.setStudentName('Shubham');
        studentObject.setStudentId(509);
        studentObject.setStudentFees(900000);
        studentObject.setStudentCourseFee(70000);

        System.debug(studentObject.getStudentAddress());
        System.assertEquals('Pune', studentObject.getStudentAddress());
        System.assertEquals('Shubham', studentObject.getStudentName());
        System.assertEquals(509, studentObject.getStudentId());
        System.assertEquals(900000, studentObject.getStudentFees());
    }
    @isTest
    public static void testStudentForConstructor(){
        Student studentObject=new Student(509,'Shubham','Pune',900000);
        studentObject.studentFees();
    }
    @isTest
    public static void testStudentCourseMethod(){
        StudentCourse objectstudent=new StudentCourse();
        objectstudent.studentFees();
    }

   

}