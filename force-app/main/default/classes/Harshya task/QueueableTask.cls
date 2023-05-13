public class QueueableTask implements Queueable{
    public Id idRecord;
    public QueueableTask(Id id){
        this.idRecord=id;
    }
    public void execute(QueueableContext qc){
        FutureMethodOfTask.methodForAccount(idRecord);
    }
}