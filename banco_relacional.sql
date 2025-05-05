
-- Criação do banco de dados RELACIONAL
CREATE DATABASE RELACIONAL;

-- Selecionar o banco de dados RELACIONAL para uso
USE RELACIONAL;

-- Criação das tabelas

-- Tabela ALUNO
CREATE TABLE ALUNO (
    ID INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela CURSO
CREATE TABLE CURSO (
    ID INT PRIMARY KEY,
    nome VARCHAR(100),
    carga_horaria INT
);

-- Tabela MATRICULA
CREATE TABLE MATRICULA (
    ID INT PRIMARY KEY,
    aluno_id INT,
    curso_id INT,
    data_matricula DATE,
    FOREIGN KEY (aluno_id) REFERENCES ALUNO(ID),
    FOREIGN KEY (curso_id) REFERENCES CURSO(ID)
);

-- Inserção de dados nas tabelas

-- ALUNO
INSERT INTO ALUNO (ID, nome, email) VALUES
(1, 'João Silva', 'joao@email.com'),
(2, 'Maria Santos', 'maria@email.com');

-- CURSO
INSERT INTO CURSO (ID, nome, carga_horaria) VALUES
(1, 'Matemática', 60),
(2, 'História', 45);

-- MATRICULA
INSERT INTO MATRICULA (ID, aluno_id, curso_id, data_matricula) VALUES
(1, 1, 1, '2024-02-15'),
(2, 2, 2, '2024-03-10');

-- Consultas com JOIN

-- 1. Listar nome do aluno, nome do curso e data de matrícula
SELECT A.nome AS Aluno, C.nome AS Curso, M.data_matricula
FROM MATRICULA M
JOIN ALUNO A ON M.aluno_id = A.ID
JOIN CURSO C ON M.curso_id = C.ID;

-- 2. Mostrar alunos e os cursos que estão matriculados
SELECT A.nome, C.nome
FROM ALUNO A
JOIN MATRICULA M ON A.ID = M.aluno_id
JOIN CURSO C ON M.curso_id = C.ID;
