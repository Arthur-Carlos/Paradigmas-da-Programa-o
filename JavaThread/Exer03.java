public class Exer03 {
    public static void main(String[] args) throws InterruptedException {
        Contador contador = new Contador();

        Thread threadIncremento = new Thread(() -> {
            for (int i = 0; i < 1000; i++) {
                contador.incrementar();
            }
        }, "Thread-Incremento");

        Thread threadDecremento = new Thread(() -> {
            for (int i = 0; i < 1000; i++) {
                contador.decrementar();
            }
        }, "Thread-Decremento");

        threadIncremento.start();
        threadDecremento.start();

        threadIncremento.join();
        threadDecremento.join();

        System.out.println("Valor final do contador: " + contador.getValor());
    }
}

class Contador {
    private int valor = 0;

    public synchronized void incrementar() {
        valor++;
    }

    public synchronized void decrementar() {
        valor--;
    }

    public synchronized int getValor() {
        return valor;
    }
}