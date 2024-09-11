-- Tabela Pacientes
CREATE TABLE Pacientes (
    numero_prontuario INT PRIMARY KEY UNIQUE,  -- Identificador único do paciente
    nome VARCHAR(100),
    data_nascimento DATE,
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);

-- Tabela Consultas
CREATE TABLE Consultas (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,  -- Identificador único da consulta
    numero_prontuario INT,  -- Paciente da consulta
    numero_registro_medico INT,  -- Médico responsável pela consulta
    data_consulta DATE,
    hora_consulta TIME,
    sintomas VARCHAR(500),
    diagnostico VARCHAR(500),
    tratamento VARCHAR(500),
    FOREIGN KEY (numero_prontuario) REFERENCES Pacientes(numero_prontuario),
    FOREIGN KEY (numero_registro_medico) REFERENCES Medicos(numero_registro)
);

-- Tabela Medicos
CREATE TABLE Medicos (
    numero_registro INT PRIMARY KEY UNIQUE,  -- Identificador único do médico
    nome VARCHAR(100),
    especialidade VARCHAR(100),
    salario DECIMAL(10, 2),
    codigo_departamento INT,  -- Departamento ao qual o médico está associado
    FOREIGN KEY (codigo_departamento) REFERENCES Departamentos(codigo_departamento)
);

-- Tabela Estudantes_Medicina
CREATE TABLE Estudantes_Medicina (
    numero_matricula INT PRIMARY KEY UNIQUE,  -- Identificador único do estudante
    nome VARCHAR(100),
    ano_ingresso YEAR,
    turma VARCHAR(50)
);

-- Tabela Estudantes_Consultas
CREATE TABLE Estudantes_Consultas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero_matricula INT,  -- Estudante que acompanhou a consulta
    id_consulta INT,  -- Consulta acompanhada pelo estudante
    FOREIGN KEY (numero_matricula) REFERENCES Estudantes_Medicina(numero_matricula),
    FOREIGN KEY (id_consulta) REFERENCES Consultas(id_consulta)
);

-- Tabela Pesquisas
CREATE TABLE Pesquisas (
    codigo_pesquisa INT PRIMARY KEY UNIQUE,  -- Identificador único da pesquisa
    titulo VARCHAR(200),
    data_inicio DATE,
    data_termino DATE,
    descricao TEXT,
    progresso TEXT,  -- Progresso da pesquisa
    resultados TEXT,  -- Resultados obtidos na pesquisa
    codigo_departamento INT,  -- Departamento vinculado à pesquisa
    FOREIGN KEY (codigo_departamento) REFERENCES Departamentos(codigo_departamento)
);

-- Tabela Medicos_Pesquisas
CREATE TABLE Medicos_Pesquisas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero_registro INT,  -- Médico envolvido na pesquisa
    codigo_pesquisa INT,  -- Pesquisa na qual o médico está envolvido
    FOREIGN KEY (numero_registro) REFERENCES Medicos(numero_registro),
    FOREIGN KEY (codigo_pesquisa) REFERENCES Pesquisas(codigo_pesquisa)
);

-- Tabela Estudantes_Pesquisas
CREATE TABLE Estudantes_Pesquisas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero_matricula INT,  -- Estudante envolvido na pesquisa
    codigo_pesquisa INT,  -- Pesquisa na qual o estudante está envolvido
    FOREIGN KEY (numero_matricula) REFERENCES Estudantes_Medicina(numero_matricula),
    FOREIGN KEY (codigo_pesquisa) REFERENCES Pesquisas(codigo_pesquisa)
);

-- Tabela Exames
CREATE TABLE Exames (
    codigo_exame INT PRIMARY KEY UNIQUE,  -- Identificador único do exame
    nome VARCHAR(100),
    descricao TEXT,
    data_realizacao DATE,
    numero_prontuario INT,  -- Paciente que realizou o exame
    numero_registro_medico INT,  -- Médico que requisitou o exame
    FOREIGN KEY (numero_prontuario) REFERENCES Pacientes(numero_prontuario),
    FOREIGN KEY (numero_registro_medico) REFERENCES Medicos(numero_registro)
);

-- Tabela Resultados_Exames
CREATE TABLE Resultados_Exames (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_exame INT,  -- Exame ao qual os resultados pertencem
    numero_prontuario INT,  -- Paciente ao qual os resultados pertencem
    numero_registro_medico INT,  -- Médico que requisitou o exame
    observacoes TEXT,  -- Observações descritivas dos resultados do exame
    valores_numericos VARCHAR(200),  -- Resultados numéricos do exame
    FOREIGN KEY (codigo_exame) REFERENCES Exames(codigo_exame),
    FOREIGN KEY (numero_prontuario) REFERENCES Pacientes(numero_prontuario),
    FOREIGN KEY (numero_registro_medico) REFERENCES Medicos(numero_registro)
);

-- Tabela Departamentos
CREATE TABLE Departamentos (
    codigo_departamento INT PRIMARY KEY UNIQUE,  -- Identificador único do departamento
    nome VARCHAR(100),
    localizacao VARCHAR(100)
);
