# MoMo SMS Analytics Dashboard

## Team Name
**InnovateX**

## Project Description
This project processes Mobile Money (MoMo) SMS messages provided in XML format, extracts and cleans transaction data, categorizes transactions, stores them in a relational database, and visualizes insights through a web-based dashboard.

The system is designed using enterprise software principles, including modular ETL pipelines, structured logging, and scalable architecture.

## Team Members
- Chibueze Onugha
- Ayomikun Atigbi
- Michelle Anyika

## High-Level System Architecture
 **Architecture Diagram:**  
 *Insert Draw.io or Miro link here*  
 Diagram image stored at: `docs/architecture.png`

### Architecture Overview
1. XML SMS data is ingested via an ETL pipeline
2. Data is parsed, cleaned, and normalized
3. Transactions are categorized (e.g., Incoming, Outgoing, Airtime, Fees)
4. Clean data is stored in SQLite
5. Aggregated analytics are exported as JSON
6. Frontend dashboard visualizes insights using charts and tables

## Scrum Board
 **Project Management Board:**  
 *Insert GitHub Projects / Trello / Jira link here*

### Initial Sprint Focus
- Repository setup
- System architecture design
- Task breakdown and role assignment

## Tech Stack
- Backend: Python, ElementTree/lxml, SQLite
- Frontend: HTML, CSS, JavaScript
- Optional API: FastAPI
- Version Control: Git & GitHub
- Agile: Scrum board (GitHub Projects)

## How to Run (Coming Soon)
ETL and dashboard instructions will be added in Week 2.

