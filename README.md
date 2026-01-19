# Maize_diseases- Knowledge-Based System
## 📌 Project Overview

The **Maize Diseases Knowledge-Based System** is an expert system designed to assist in the identification and analysis of maize diseases based on observable symptoms and environmental conditions.
The system combines **knowledge representation**, **rule-based reasoning**, a **MariaDB relational database**, and a **Streamlit web interface** to provide an interactive decision-support tool.

---

## 🎯 Objectives

* To model expert agricultural knowledge using facts and rules
* To store and manage disease knowledge in a relational database
* To infer possible maize diseases from symptoms and conditions
* To provide a user-friendly interface for farmers and researchers

---

## 🧠 System Architecture

The system consists of four main layers:

1. **Knowledge Base**
2. **Database Layer (MariaDB)**
3. **Inference & Application Logic (Python)**
4. **User Interface (Streamlit)**

---

## 🗂️ Knowledge Base Design

The knowledge base represents expert knowledge as **facts** distributed across six tables:

| Table          | Description                                   |
| -------------- | --------------------------------------------- |
| `has_symptom`  | Links diseases to observable symptoms         |
| `indicates`    | Symptoms that suggest a specific disease      |
| `triggered_by` | Conditions that cause diseases                |
| `risk_factor`  | Conditions that increase disease risk         |
| `co_occurs`    | Diseases that commonly appear together        |
| `severe_under` | Conditions under which diseases become severe |

### 📊 Total Knowledge Facts

The system currently contains **104 facts**, distributed as follows:

* 30 disease–symptom facts
* 20 symptom–disease indication facts
* 20 disease–condition triggers
* 15 disease risk factors
* 9 disease co-occurrence rules
* 10 severity rules

Each row in the database represents one expert-derived fact.

---

## 🧩 Inference Logic

The system reasons by:

* Matching user-selected symptoms and conditions
* Querying relevant facts from the database
* Combining multiple rules to infer:

  * Possible diseases
  * Severity levels
  * Related or co-occurring diseases

This approach reflects **forward-chaining rule-based reasoning**, commonly used in expert systems.

---

## 🛠️ Technologies Used

| Technology   | Purpose                         |
| ------------ | ------------------------------- |
| Python       | Application logic and inference |
| MariaDB      | Knowledge base storage          |
| Streamlit    | Web-based user interface        |
| SQL          | Knowledge querying              |             |

---

## How to Run the System

### 1️ Clone the Repository

```bash
git clone https://github.com/your-username/maize-diseases-system.git
cd maize-diseases-system
```

---

### 2️ Set Up the Database

* Install **MariaDB**
* Create the database:

```sql
CREATE DATABASE maize_diseases;
```

* Import the provided SQL schema and data files

---

### 3️ Install Python Dependencies

```bash
pip install -r requirements.txt
```

Required packages include:

* `streamlit`
* `mysql-connector-python`

---

### 4️ Run the Streamlit Application

```bash
streamlit run app.py
```

The application will open in your browser at:

```
http://localhost:8501
```

---

##  Verifying the System

The system is verified by:

* Successful database queries (fact counts match expectations)
* Correct disease outputs based on known symptom-condition combinations
* Live interaction through the Streamlit interface

Example verification query:

```sql
SELECT COUNT(*) FROM has_symptom;
```

---

##  Sample Use Case

1. User selects symptoms such as **Yellowing** and **Wilting**
2. User selects environmental conditions such as **High Humidity**
3. System infers likely diseases such as **MLND** or **Fusarium Wilt**
4. Severity and related diseases are displayed

---

##  Academic Relevance

This project demonstrates:

* Knowledge representation
* Rule-based reasoning
* Expert system design
* Practical application of AI in agriculture

