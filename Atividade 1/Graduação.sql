
CREATE TABLE Professores (
    id_contribuinte INT PRIMARY KEY UNIQUE,  
    nome VARCHAR(100),
    idade INT,
    posto VARCHAR(50),
    especialidade_investigacao VARCHAR(100)
);


CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY UNIQUE,  
    nome VARCHAR(100),
    escritorio_principal VARCHAR(100),
    id_lider INT,  
    FOREIGN KEY (id_lider) REFERENCES Professores(id_contribuinte)
);


CREATE TABLE Projetos (
    id_projeto INT PRIMARY KEY UNIQUE,  
    organismo_financiador VARCHAR(100),
    data_inicio DATE,
    data_fim DATE,
    orcamento DECIMAL(15, 2),
    id_investigador_principal INT,  
    FOREIGN KEY (id_investigador_principal) REFERENCES Professores(id_contribuinte)
);


CREATE TABLE Estudantes_Pos_Graduacao (
    id_contribuinte INT PRIMARY KEY UNIQUE,  
    nome VARCHAR(100),
    idade INT,
    plano_curso VARCHAR(50),  
    id_departamento INT,  
    id_aconselhador INT,  
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento),
    FOREIGN KEY (id_aconselhador) REFERENCES Estudantes_Pos_Graduacao(id_contribuinte)
);


CREATE TABLE Professores_Projetos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_projeto INT,
    id_professor INT,
    FOREIGN KEY (id_projeto) REFERENCES Projetos(id_projeto),
    FOREIGN KEY (id_professor) REFERENCES Professores(id_contribuinte)
);


CREATE TABLE Estudantes_Projetos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_projeto INT,
    id_estudante INT,
    id_supervisor INT,  
    FOREIGN KEY (id_projeto) REFERENCES Projetos(id_projeto),
    FOREIGN KEY (id_estudante) REFERENCES Estudantes_Pos_Graduacao(id_contribuinte),
    FOREIGN KEY (id_supervisor) REFERENCES Professores(id_contribuinte)
);


CREATE TABLE Professores_Departamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT,
    id_departamento INT,
    porcentagem_tempo INT,  
    FOREIGN KEY (id_professor) REFERENCES Professores(id_contribuinte),
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);
