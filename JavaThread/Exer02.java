public class Exer02 {
    public static void main(String[] args) {
        System.out.println("Iniciando gerenciador de downloads...\n");

        DownloadArquivo download1 = new DownloadArquivo("Ubuntu-24.04.iso", 4500);
        DownloadArquivo download2 = new DownloadArquivo("Relatorio_Anual.pdf", 150);
        DownloadArquivo download3 = new DownloadArquivo("Backup_Fotos.zip", 1200);

        Thread t1 = new Thread(download1, "Worker-1");
        Thread t2 = new Thread(download2, "Worker-2");
        Thread t3 = new Thread(download3, "Worker-3");

        t1.start();
        t2.start();
        t3.start();
    }
}


class DownloadArquivo implements Runnable {
    private final String nomeArquivo;
    private final int tamanhoMB;

    public DownloadArquivo(String nomeArquivo, int tamanhoMB) {
        this.nomeArquivo = nomeArquivo;
        this.tamanhoMB = tamanhoMB;
    }

    @Override
    public void run() {
        String threadAtual = Thread.currentThread().getName();
        System.out.printf("[%s] Iniciando download: %s (%d MB)%n", threadAtual, nomeArquivo, tamanhoMB);

        for (int progresso = 20; progresso <= 100; progresso += 20) {
            try {
                long tempoEspera = Math.max(200, tamanhoMB / 5);
                Thread.sleep(tempoEspera);

                System.out.printf("[%s] %s -> %d%% concluido%n", threadAtual, nomeArquivo, progresso);

            } catch (InterruptedException e) {
                System.out.printf("[%s] Download de %s foi cancelado!%n", threadAtual, nomeArquivo);
                Thread.currentThread().interrupt();
                return;
            }
        }

        System.out.printf("[%s] CONCLUIDO: %s%n", threadAtual, nomeArquivo);
    }
}