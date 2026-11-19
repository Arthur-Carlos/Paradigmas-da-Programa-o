import java.util.Scanner;

public class Exer04 {

    public static void main(String[] args) {
        Temporizador temporizador = new Temporizador();
        Thread threadTemporizador = new Thread(temporizador, "Thread-Relogio");

        System.out.println("=== CONTROLE DO TEMPORIZADOR ===");
        System.out.println("Comandos: [P] Pausar | [R] Retomar | [S] Sair\n");

        threadTemporizador.start();

        try (Scanner scanner = new Scanner(System.in)) {
            while (true) {
                String comando = scanner.nextLine().trim().toUpperCase();

                switch (comando) {
                    case "P":
                        temporizador.pausar();
                        break;
                    case "R":
                        temporizador.retomar();
                        break;
                    case "S":
                        temporizador.parar();
                        threadTemporizador.interrupt();
                        System.out.println("Temporizador encerrado.");
                        return;
                    default:
                        System.out.println("Comando inválido. Use P, R ou S.");
                }
            }
        }
    }
}

class Temporizador implements Runnable {
    private int segundos = 0;
    private boolean pausado = false;
    private volatile boolean executando = true;
    private final Object lock = new Object();

    @Override
    public void run() {
        while (executando) {
            synchronized (lock) {
                while (pausado && executando) {
                    try {
                        lock.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        return;
                    }
                }
            }

            if (!executando) break;

            try {
                Thread.sleep(1000);
                segundos++;
                System.out.println("Tempo: " + segundos + "s");
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                break;
            }
        }
    }

    public void pausar() {
        synchronized (lock) {
            if (!pausado) {
                pausado = true;
                System.out.println(">>> Temporizador PAUSADO.");
            }
        }
    }

    public void retomar() {
        synchronized (lock) {
            if (pausado) {
                pausado = false;
                System.out.println(">>> Temporizador RETOMADO.");
                lock.notify();
            }
        }
    }

    public void parar() {
        executando = false;
        synchronized (lock) {
            lock.notify();
        }
    }
}
