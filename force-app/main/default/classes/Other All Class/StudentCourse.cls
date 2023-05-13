public  class StudentCourse extends Student {
    //Variables
    private Integer studentCourseFee;
    //Constructor
    public StudentCourse() {
		this.studentCourseFee=0;
    }
    //Setter Method for assigning the Value
    public void setStudentCourseFee(Integer studentCourseFee){
         this.studentCourseFee=studentCourseFee;
    }
    //override method
    public override Integer studentFees(){         
        return getStudentFees()+studentCourseFee;
    }
}

/*
StudentCourse arr=new StudentCourse();
arr.setStudentId(10);
arr.setStudentName('Shubham');
arr.setStudentAddress('Pune');
arr.setStudentFees(1000);
arr.setStudentCourseFee(1000);
System.debug(arr.getStudentId()+' '+arr.getStudentName()+' '+arr.studentFees());
*/