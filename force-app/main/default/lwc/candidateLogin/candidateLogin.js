import { LightningElement,track,wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import usernamePasswordAuth from '@salesforce/apex/ControllerRecruitment.usernamePasswordAuth';
import allPositionRecruitment from "@salesforce/apex/ControllerRecruitment.allPositionRecruitment";
import appliedPositionRecruitment from "@salesforce/apex/ControllerRecruitment.appliedPositionRecruitment";
import jopApplication from '@salesforce/apex/ControllerRecruitment.jopApplication';
import optGenrator from '@salesforce/apex/ControllerRecruitment.optGenrator';
import otpSendOnMail from '@salesforce/apex/ControllerRecruitment.otpSendOnMail';
import emailOfCandidate from '@salesforce/apex/ControllerRecruitment.emailOfCandidate';
import passwordChangeMethod from '@salesforce/apex/ControllerRecruitment.passwordChangeMethod';

import { ShowToastEvent } from "lightning/platformShowToastEvent";

import EMAIL_FIELD from '@salesforce/schema/Candidate__c.Email__c';
import FIRSTNAME_FIELD from '@salesforce/schema/Candidate__c.First_Name__c';
import LASTNAME_FIELD from '@salesforce/schema/Candidate__c.Last_Name__c';
import PHONE_FIELD from '@salesforce/schema/Candidate__c.Phone__c';
import { getRecord, getFieldValue, } from 'lightning/uiRecordApi';

export default class CandidateLogin extends NavigationMixin(LightningElement)  {

    fieldList2=['First_Name__c','Last_Name__c','Email__c','Phone__c'];
    @wire(getRecord, { recordId: '$candidateId', fields: [FIRSTNAME_FIELD, LASTNAME_FIELD, PHONE_FIELD, EMAIL_FIELD] })
    lead;

    get email() {
        return getFieldValue(this.lead.data, EMAIL_FIELD);
    }
    get company() {
        return getFieldValue(this.lead.data, FIRSTNAME_FIELD);
    }
    get leadSource() {
        return getFieldValue(this.lead.data, LASTNAME_FIELD);
    }
    get description() {
        return getFieldValue(this.lead.data, PHONE_FIELD);
    }

    
    columns =  [
        { label: 'Position Name', fieldName: 'Name' },
        { label: 'Skills Required', fieldName: 'Skills_Required__c'},
        { label: 'Close Date', fieldName: 'Close_Date__c'}
        
    ];
    @track showButton=false;
    @track errorMessage="";
    @track count=0;
    @track arr=[];
    boolValLogin=true;
    boolValSignup=false;
    @track Username=" ";
    @track Password=" ";
    @track Username1='';
    @track Password1='';
    @track positionId="";
    @track candidateId="";
    onSignupclick(){
       
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Candidate__c',
                actionName: 'new'
            }

        });
    }


    @wire(allPositionRecruitment,{canId:'$candidateId',itr:'$count'})positionrecord;
    @wire(appliedPositionRecruitment,{canId:'$candidateId',itr:'$count'})positionrecord12;
    

    @wire(usernamePasswordAuth,{usName:'$Username', pass:'$Password'})
    record({ error, data }) {
        if (data) {
            this.arr = data;
            if (this.arr.length > 0 && this.arr[0].Id) {
                this.candidateId = this.arr[0].Id;
                console.log('data = ' + data);
                for (let key in data) {
                    this.count++;
                }
                this.boolValLogin=false;
                    this.boolValSignup = true;
                // if (this.arr.length == 0) {
                //     this.errorMessage = '*Invalid username and password!';
                // } 
                 if (this.arr.length == 1) {
                    this.boolValLogin=false;
                    this.boolValSignup = true;
                }
            } else {
                this.errorMessage = '*Invalid username and password!';
            }
        } else if (error) {
            this.errorMessage = '*Invalid username and password!';
        }
        
    }

    onLoginClick(){
        this.Username=this.Username1;
        this.Password=this.Password1;
    }
    onChangeUsername(event){
        this.errorMessage='';
        this.Username1=event.target.value;
    }
    onChangePassword(event){
        this.errorMessage='';
        this.Password1=event.target.value;
    }

    onApply(){
        jopApplication({posId:this.positionId,canId:this.candidateId})
        .then((data) => {   
            console.log('JobApplication = '+data);
            
            if(data==true){
                this.count++;
                const event = new ShowToastEvent({      
                    title: 'Success',       
                    message: 'You applied for this job position successfully!',       
                    variant: 'success',       
                    mode: 'dismissable'       
                  });     
                  this.dispatchEvent(event);  
            }    
           })       
           .catch((error) => {    
             const event = new ShowToastEvent({      
               title: 'Error',       
               message: 'Sorry you can not Applicable for this position',       
               variant: 'Error',       
               mode: 'dismissable'       
             });     
             this.dispatchEvent(event);      
            console.error(error);       
            this.message = "Error updating the lead. Please try again.";       
           });
    }

    handleInterestSelect(event) {
        const selectedRows = event.detail.selectedRows;
          if (selectedRows.length > 0) {
            this.positionId = selectedRows[0].Id;
            this.showButton = true;
          } else {
            this.positionId = null;
            this.showButton = false;
          }
         console.log('selectedInterestId')
  }
  candidateUpdate1(event){
    const evt = new ShowToastEvent({
     title: 'Application Form Status',     
     message: 'Candidate updated Successfully',     
     variant: 'success',     
     mode: 'dismissable'     
   });     
   this.dispatchEvent(evt);     
   }
   //--------------------------------------------------------------------------------------------------------
   @track emailVerifySuccess=false;
   @track resetEmail='';
   @track oneTimePass='';
   @track otpInput;
   @track errorMessageOtp="";
   @track emails="";
   @track candidateIdNew='';
   @track arrays=[];
   @track newPassBool=false;
   boolValForget=false;
   boolValNewPas=false;
   verifyEmail(event){
        this.resetEmail=event.target.value;
        console.log(this.resetEmail);
        console.log(this.fieldList2[2].value);
   }
   onSendOTPClick(){ 
    this.emails1=this.resetEmail;
           emailOfCandidate({Email:this.resetEmail})
            .then((data) => {
            this.arrays = data;
            if (this.arrays.length > 0 && this.arrays[0].Id) {
                
                // for (let key in data) {
                //     this.count++;
                // }
                if (this.arr.length == 0) {
                    this.emailVerifySuccess=false;
                    this.errorMessageOtp = '*This email is not valid!';
                }else{
                    this.emailVerifySuccess=true;
                    this.candidateIdNew = this.arrays[0].Id;
                    console.log('this.candidateIdNew = ' + this.candidateIdNew);
                } 
                //  if (this.arrays.length == 1) {
                //     this.boolValLogin=false;
                //     this.boolValNewPas=true;
                //     this.emailVerifySuccess=true;
                // }
            } else {
                this.errorMessageOtp = '*This email is not valid!';
            }
        })
        .catch((error) => {
            this.errorMessageOtp = '*This email is not valid!';
        })

          // if(this.emailVerifySuccess==true){

            optGenrator()
            .then((data) => {   
                console.log('Opt Genrator = '+data);
                
                    this.oneTimePass=data;
                    console.log('this.oneTimePass = '+this.oneTimePass);
               })       
               .catch((error) => {    
                 const event = new ShowToastEvent({      
                   title: 'Error',       
                   message: 'Something went wrong', 
                   variant: 'Error',       
                   mode: 'dismissable'       
                 });     
                 this.dispatchEvent(event);      
                console.error(error);  
               });
    

           setTimeout(() => {
           otpSendOnMail({Email1:this.resetEmail,OTPnew:this.oneTimePass})
           .then((data) => {   
            console.log('Mail sended = '+data);
                
                if(data==true){
                    const event = new ShowToastEvent({      
                        title: "Success!",
                        message: "OTP is send successfully on your Email ! ",
                        variant: "success"      
                      });     
                      this.dispatchEvent(event);      
                }
           })       
           .catch((error) => {    
             const event = new ShowToastEvent({      
               title: 'Error',       
               message: 'Something went wrong', 
               variant: 'Error',       
               mode: 'dismissable'       
             });     
             this.dispatchEvent(event);      
            console.error(error);  
           });
        }, 1000);
    //}
    //}
    console.log(this.errorMessageOtp);
   }
   verifyOtp(event){
    this.errorMessageOtp="";
        this.otpInput=event.target.value;
        console.log(this.otpInput);
   }
   onVerifyButtonclick(){
    console.log("this.otpInput"+this.otpInput);
    console.log("this.oneTimePass"+this.oneTimePass);
    if(this.otpInput!=this.oneTimePass){
        this.errorMessageOtp="Invalid OTP";
    }
    else{
        this.boolValForget=false;
        this.newPassBool=true;
        this.errorMessageOtp="OTP is valid";
        this.emails1=this.emails;
    }
   }
   resetPass(){
    this.boolValLogin = false;
    this.boolValForget=true;
   }
   //------------------------------------------------------------------------------------------------------------
   //------------------------------------------------------------------------------------------------------------


   @track errorMessageNewPassword="";
   @track newpasswordInput="";
   @track confirmpasswordInput="";
   onNewPassword(event){
    this.newpasswordInput=event.target.value;
   }

   onNewCofirmPassword(event){
    this.confirmpasswordInput=event.target.value;
   }

   onNewPasswordSubmit(){
    if(this.newpasswordInput!=this.confirmpasswordInput){
        this.errorMessageNewPassword="*Password does not match";
    }
    else{
        passwordChangeMethod({ Email:this.resetEmail,passwordNew:this.confirmpasswordInput})
        .then((data) => {   
            console.log('Mail sended = '+data);
                
                if(data==true){
                    const event = new ShowToastEvent({      
                        title: "Success!",
                        message: "New Password is created successfully! ",
                        variant: "success"      
                      });     
                      this.dispatchEvent(event);
                      this.newPassBool=false;
                      this.boolValLogin=true;      
                }
           })       
           .catch((error) => {    
             const event = new ShowToastEvent({      
               title: 'Error',       
               message: 'Something went wrong', 
               variant: 'Error',       
               mode: 'dismissable'       
             });     
             this.dispatchEvent(event);      
            console.error(error);  
           });
    }
   }
}