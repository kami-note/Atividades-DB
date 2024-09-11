CREATE TABLE Musicos (
    id_musico INT PRIMARY KEY UNIQUE,  
    nome VARCHAR(100),
    morada VARCHAR(200),
    telefone VARCHAR(20)
);

CREATE TABLE Instrumentos (
    id_instrumento INT PRIMARY KEY UNIQUE,  
    nome VARCHAR(100)  
);

CREATE TABLE Discos (
    id_disco INT PRIMARY KEY UNIQUE,  
    titulo VARCHAR(100),
    data_gravacao DATE,
    formato VARCHAR(10),  
    id_produtor INT,  
    FOREIGN KEY (id_produtor) REFERENCES Musicos(id_musico)
);

CREATE TABLE Musicas (
    id_musica INT PRIMARY KEY UNIQUE,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    id_disco INT,  
    FOREIGN KEY (id_disco) REFERENCES Discos(id_disco)
);

CREATE TABLE Musicos_Instrumentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_musico INT,
    id_instrumento INT,
    FOREIGN KEY (id_musico) REFERENCES Musicos(id_musico),
    FOREIGN KEY (id_instrumento) REFERENCES Instrumentos(id_instrumento)
);

CREATE TABLE Musicos_Musicas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_musico INT,
    id_musica INT,
    FOREIGN KEY (id_musico) REFERENCES Musicos(id_musico),
    FOREIGN KEY (id_musica) REFERENCES Musicas(id_musica)
);
