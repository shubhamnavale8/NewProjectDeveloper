import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  greeting = 'World';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
  
  timeLive='Click Here For Time';
  //Date time1;
  checkTime(){
    const date=new Date();
    const hours=date.getHours();
    const min=date.getMinutes();
    this.timeLive=hours+':'+min;
  }
}