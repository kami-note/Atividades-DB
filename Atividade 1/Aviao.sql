
CREATE TABLE Avioes (
    numero_registo VARCHAR(18) PRIMARY KEY UNIQUE,  
    codigo_modelo VARCHAR(10),  
    FOREIGN KEY (codigo_modelo) REFERENCES Modelos_Avioes(codigo_modelo)
);


CREATE TABLE Modelos_Avioes (
    codigo_modelo VARCHAR(10) PRIMARY KEY UNIQUE,  
    capacidade INT,  
    peso INT  
);


CREATE TABLE Tecnicos (
    nro_bi INT PRIMARY KEY UNIQUE,  
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    salario DECIMAL(10, 2)
);


CREATE TABLE Pericia_Modelos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nro_bi INT,  
    codigo_modelo VARCHAR(10),  
    FOREIGN KEY (nro_bi) REFERENCES Tecnicos(nro_bi),
    FOREIGN KEY (codigo_modelo) REFERENCES Modelos_Avioes(codigo_modelo)
);


CREATE TABLE Controladores_Aereos (
    nro_bi INT PRIMARY KEY UNIQUE,  
    data_exame DATE,  
    FOREIGN KEY (nro_bi) REFERENCES Tecnicos(nro_bi)
);


CREATE TABLE Empregados (
    nro_bi INT PRIMARY KEY UNIQUE,  
    nro_membro_sindicato INT,  
    FOREIGN KEY (nro_bi) REFERENCES Tecnicos(nro_bi)
);


CREATE TABLE Testes_Avioes (
    numero_teste INT PRIMARY KEY UNIQUE,  
    nome VARCHAR(100),
    pontuacao_maxima INT
);


CREATE TABLE Testes_Efectuados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero_registo VARCHAR(18),  
    numero_teste INT,  
    nro_bi INT,  
    data_efectuacao DATE,  
    horas_gastas DECIMAL(5, 2),  
    pontuacao_obtida INT,  
    FOREIGN KEY (numero_registo) REFERENCES Avioes(numero_registo),
    FOREIGN KEY (numero_teste) REFERENCES Testes_Avioes(numero_teste),
    FOREIGN KEY (nro_bi) REFERENCES Tecnicos(nro_bi)
);
