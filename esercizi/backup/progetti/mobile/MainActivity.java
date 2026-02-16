package com.example.myapp;

public class MainActivity {
    
    private String appName = "La mia app";
    
    public void onCreate() {
        System.out.println("App avviata: " + appName);
        inizializza();
    }
    
    private void inizializza() {
        System.out.println("Inizializzazione completata");
    }
    
    public static void main(String[] args) {
        MainActivity app = new MainActivity();
        app.onCreate();
    }
}
