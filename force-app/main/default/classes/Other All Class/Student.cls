public virtual class Student {
    // Variables
    private Integer studentId;
    private String studentName;
    private String studentAddress;
    private Integer studentFee;
    //Parameterise Constructor
    public Student( Integer studentId,String studentName,String studentAddress,Integer studentFee) {
        this.studentAddress=studentAddress;
        this.studentId=studentId;
        this.studentName=studentName;
        this.studentFee=studentFee;
    }
    //Defult Constructor
    public Student(){
		this.studentAddress=' ';
        this.studentId=0;
        this.studentName=' ';
        this.studentFee=0;
    }
    //setter methods for assigning the value to studentId
    public void setStudentId(Integer studentId){
        this.studentId=studentId;
    }
    //getter methods for returning the value of studentId
    public Integer getStudentId(){
        return studentId;
    }
    //setter methods for assigning the value to studentName
    public void setStudentName(String studentName){
        this.studentName=studentName;
    }
    //getter methods for returning the value of studentName
    public String getStudentName(){
        return studentName;
    }
    //setter methods for assigning the value to studentAddress
    public void setStudentAddress(String studentAddress){
        this.studentAddress=studentAddress;
    }
    //getter methods for returning the value of studentAddress
    public String getStudentAddress(){
        return studentAddress;
    }
    //getter methods for returning the value of studentFee
    public Integer getStudentFees(){
        return studentFee;
    }
    //setter methods for assigning the value to studentFee
     public void setStudentFees(Integer studentFee){
        this.studentFee=studentFee;
     }
    //overriden method
     public virtual Integer studentFees(){
        return getStudentFees();
    }
}