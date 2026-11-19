public class Exer01 {
    public static void main(String[] args) {
        Runnable tarefa = () -> {
            String nomeThread = Thread.currentThread().getName();

            for (int i = 1; i <= 10; i++) {
                System.out.println(nomeThread + " - Contador: " + i);

                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    System.out.println(nomeThread + " foi interrompida.");
                    Thread.currentThread().interrupt();
                }
            }
            System.out.println(nomeThread + " finalizou!");
        };

        Thread thread1 = new Thread(tarefa, "Thread-Alfa");
        Thread thread2 = new Thread(tarefa, "Thread-Beta");

        thread1.start();
        thread2.start();
    }
    
}
