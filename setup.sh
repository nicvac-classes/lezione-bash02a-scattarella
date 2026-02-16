#!/bin/bash

# ============================================
# SETUP - Lezione Bash02
# Gestione file: visualizzare, copiare,
# spostare, eliminare, wildcards,
# reindirizzamento e pipeline
# ============================================

echo "🔧 Creazione ambiente di esercitazione..."
echo ""

# Directory base (rilevata automaticamente dalla posizione dello script)
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Pulizia ambiente precedente (se esiste)
rm -rf "$BASE_DIR/esercizi"

# ============================================
# STRUTTURA DIRECTORY
# ============================================

mkdir -p "$BASE_DIR/esercizi/documenti"
mkdir -p "$BASE_DIR/esercizi/archivio"
mkdir -p "$BASE_DIR/esercizi/progetti/webapp"
mkdir -p "$BASE_DIR/esercizi/progetti/mobile"
mkdir -p "$BASE_DIR/esercizi/backup"
mkdir -p "$BASE_DIR/esercizi/log"
mkdir -p "$BASE_DIR/esercizi/sandbox"

# ============================================
# FILE DI TESTO - DOCUMENTI
# ============================================

cat << 'EOF' > "$BASE_DIR/esercizi/documenti/appunti_reti.txt"
Lezione 1 - Modello OSI

Il modello OSI (Open Systems Interconnection) è composto da 7 livelli:

1. Fisico - trasmissione dei bit sul mezzo fisico
2. Data Link - gestione dei frame e accesso al mezzo
3. Rete - instradamento dei pacchetti (IP)
4. Trasporto - comunicazione end-to-end (TCP, UDP)
5. Sessione - gestione delle sessioni di comunicazione
6. Presentazione - codifica e crittografia dei dati
7. Applicazione - interfaccia con l'utente (HTTP, FTP, SMTP)

Il modello TCP/IP semplifica questi livelli in 4:
- Accesso alla rete (livelli 1-2)
- Internet (livello 3)
- Trasporto (livello 4)
- Applicazione (livelli 5-7)

Ogni livello comunica solo con il livello adiacente.
Il principio di incapsulamento prevede che ogni livello aggiunga un header ai dati.
EOF

cat << 'EOF' > "$BASE_DIR/esercizi/documenti/appunti_sicurezza.txt"
Sicurezza Informatica - Concetti Base

La triade CIA:
- Confidentiality (Riservatezza): solo chi è autorizzato può accedere ai dati
- Integrity (Integrità): i dati non vengono modificati in modo non autorizzato
- Availability (Disponibilità): i dati sono accessibili quando necessario

Tipi di attacco:
- Phishing: email fraudolente per rubare credenziali
- Man-in-the-Middle: intercettazione delle comunicazioni
- DDoS: sovraccarico di un server con richieste
- SQL Injection: inserimento di codice SQL malevolo
- Brute Force: tentativi ripetuti di indovinare password

Contromisure:
- Firewall: filtraggio del traffico di rete
- Antivirus: rilevamento di malware
- Crittografia: cifratura dei dati sensibili
- Autenticazione a due fattori (2FA)
- Backup regolari dei dati
EOF

cat << 'EOF' > "$BASE_DIR/esercizi/documenti/appunti_database.txt"
Database Relazionali - Introduzione

Un database relazionale organizza i dati in tabelle (relazioni).
Ogni tabella è composta da righe (tuple) e colonne (attributi).

Concetti chiave:
- Chiave primaria (PK): identifica univocamente ogni riga
- Chiave esterna (FK): collega due tabelle tra loro
- Normalizzazione: processo per eliminare la ridondanza

Comandi SQL fondamentali:
- SELECT: interrogare i dati
- INSERT: inserire nuovi record
- UPDATE: modificare record esistenti
- DELETE: eliminare record

Esempio di query:
SELECT nome, cognome FROM studenti WHERE classe = '4IC';

Le JOIN permettono di combinare dati da più tabelle:
- INNER JOIN: solo le righe con corrispondenza in entrambe le tabelle
- LEFT JOIN: tutte le righe della tabella sinistra
- RIGHT JOIN: tutte le righe della tabella destra
EOF

cat << 'EOF' > "$BASE_DIR/esercizi/documenti/todo.txt"
Lista attività - Progetto finale

[x] Definire i requisiti del progetto
[x] Creare il diagramma ER del database
[ ] Implementare il backend in Java
[ ] Creare le API REST
[ ] Sviluppare il frontend HTML/CSS
[ ] Test funzionali
[ ] Documentazione tecnica
[ ] Presentazione finale

Scadenze:
- Backend: 15 marzo
- Frontend: 30 marzo
- Consegna finale: 15 aprile
EOF

# ============================================
# FILE DI TESTO - PROGETTI
# ============================================

cat << 'EOF' > "$BASE_DIR/esercizi/progetti/webapp/index.html"
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Il mio progetto</title>
</head>
<body>
    <h1>Benvenuto nel progetto webapp</h1>
    <p>Questa è una pagina di esempio.</p>
</body>
</html>
EOF

cat << 'EOF' > "$BASE_DIR/esercizi/progetti/webapp/style.css"
body {
    font-family: Arial, sans-serif;
    margin: 20px;
    background-color: #f0f0f0;
}

h1 {
    color: #333;
}

p {
    color: #666;
    line-height: 1.6;
}
EOF

cat << 'EOF' > "$BASE_DIR/esercizi/progetti/webapp/app.js"
// Applicazione principale
function saluta(nome) {
    console.log("Ciao, " + nome + "!");
}

function somma(a, b) {
    return a + b;
}

function sottrazione(a, b) {
    return a - b;
}

// Esecuzione
saluta("Studente");
console.log("2 + 3 = " + somma(2, 3));
console.log("10 - 4 = " + sottrazione(10, 4));
EOF

cat << 'EOF' > "$BASE_DIR/esercizi/progetti/mobile/MainActivity.java"
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
EOF

cat << 'EOF' > "$BASE_DIR/esercizi/progetti/mobile/config.txt"
# Configurazione app mobile
app.name=La mia app
app.version=1.0
app.debug=true
app.language=it
database.host=localhost
database.port=3306
database.name=myapp_db
EOF

# ============================================
# FILE DI LOG
# ============================================

cat << 'EOF' > "$BASE_DIR/esercizi/log/server.log"
2024-01-15 08:00:01 [INFO] Server avviato sulla porta 8080
2024-01-15 08:00:02 [INFO] Connessione al database stabilita
2024-01-15 08:05:15 [INFO] Richiesta GET /index.html - 200 OK
2024-01-15 08:05:16 [INFO] Richiesta GET /style.css - 200 OK
2024-01-15 08:10:30 [WARNING] Tentativo di accesso non autorizzato da 192.168.1.100
2024-01-15 08:10:31 [WARNING] Password errata per utente admin
2024-01-15 08:15:00 [INFO] Richiesta POST /api/login - 200 OK
2024-01-15 08:20:45 [ERROR] Connessione al database persa
2024-01-15 08:20:46 [ERROR] Timeout nella riconnessione al database
2024-01-15 08:20:50 [INFO] Riconnessione al database riuscita
2024-01-15 08:30:00 [INFO] Richiesta GET /api/studenti - 200 OK
2024-01-15 08:35:22 [WARNING] Memoria disponibile sotto il 20%
2024-01-15 08:40:00 [INFO] Richiesta PUT /api/studenti/15 - 200 OK
2024-01-15 08:45:10 [ERROR] File non trovato: /images/logo.png - 404
2024-01-15 08:50:00 [INFO] Backup automatico completato
2024-01-15 09:00:00 [INFO] Richiesta GET /api/classi - 200 OK
2024-01-15 09:15:33 [WARNING] Certificato SSL in scadenza tra 7 giorni
2024-01-15 09:30:00 [INFO] Pulizia cache completata
2024-01-15 09:45:00 [ERROR] Impossibile inviare email di notifica
2024-01-15 10:00:00 [INFO] Server in fase di arresto
2024-01-15 10:00:01 [INFO] Connessione al database chiusa
2024-01-15 10:00:02 [INFO] Server arrestato correttamente
EOF

cat << 'EOF' > "$BASE_DIR/esercizi/log/accessi.log"
2024-01-15 08:05:00 mario.rossi login successo 192.168.1.10
2024-01-15 08:10:30 admin login fallito 192.168.1.100
2024-01-15 08:10:31 admin login fallito 192.168.1.100
2024-01-15 08:15:00 admin login successo 192.168.1.100
2024-01-15 08:20:00 luca.bianchi login successo 192.168.1.20
2024-01-15 08:25:00 anna.verdi login successo 192.168.1.30
2024-01-15 08:30:00 mario.rossi logout 192.168.1.10
2024-01-15 08:35:00 guest login fallito 192.168.1.50
2024-01-15 08:40:00 luca.bianchi logout 192.168.1.20
2024-01-15 08:45:00 sara.neri login successo 192.168.1.40
2024-01-15 09:00:00 admin logout 192.168.1.100
2024-01-15 09:15:00 anna.verdi logout 192.168.1.30
2024-01-15 09:30:00 sara.neri logout 192.168.1.40
EOF

# ============================================
# FILE VARI PER WILDCARDS
# ============================================

touch "$BASE_DIR/esercizi/archivio/foto_roma_2023.jpg"
touch "$BASE_DIR/esercizi/archivio/foto_milano_2023.jpg"
touch "$BASE_DIR/esercizi/archivio/foto_napoli_2024.jpg"
touch "$BASE_DIR/esercizi/archivio/foto_roma_2024.jpg"
touch "$BASE_DIR/esercizi/archivio/documento_gennaio.pdf"
touch "$BASE_DIR/esercizi/archivio/documento_febbraio.pdf"
touch "$BASE_DIR/esercizi/archivio/documento_marzo.pdf"
touch "$BASE_DIR/esercizi/archivio/relazione_finale.docx"
touch "$BASE_DIR/esercizi/archivio/relazione_intermedia.docx"
touch "$BASE_DIR/esercizi/archivio/presentazione.pptx"
touch "$BASE_DIR/esercizi/archivio/budget_2023.xlsx"
touch "$BASE_DIR/esercizi/archivio/budget_2024.xlsx"
touch "$BASE_DIR/esercizi/archivio/note.txt"
touch "$BASE_DIR/esercizi/archivio/readme.md"

# ============================================
# FILE NASCOSTO
# ============================================

cat << 'EOF' > "$BASE_DIR/esercizi/documenti/.config_segreto"
# File di configurazione nascosto
password_db=supersegreta123
api_key=abc123def456
secret_token=xyz789
EOF

# ============================================
# COMPLETAMENTO
# ============================================

echo "✅ Ambiente creato con successo!"
echo ""
echo "📁 Struttura creata in: $BASE_DIR/esercizi/"
echo ""
echo "Contenuto:"
if command -v tree &> /dev/null; then
    tree "$BASE_DIR/esercizi/" -a
else
    echo "(installa 'tree' per una visualizzazione migliore: sudo apt install tree)"
    find "$BASE_DIR/esercizi/" -not -path '*/\.*' | head -40
fi
echo ""
echo "🚀 Sei pronto per iniziare gli esercizi! Apri il README.md"
