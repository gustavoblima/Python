CREATE TABLE estudante(
    idEstudante INT NOT NULL,
    nome VARCHAR(45),
    ultimoNome VARCHAR(45),
    turma INT,
    idade INT,
    PRIMARY KEY (idEstudante));

CREATE TABLE  tipoLivro (
    idTipo INT NOT NULL,
    nomeTipo VARCHAR(45),
    PRIMARY KEY (idTipo));

 CREATE TABLE autor(
    idAutor INT NOT NULL,
    nomeAutor VARCHAR(45),
    ultimoNomeAutor VARCHAR(45),
    PRIMARY KEY (idAutor));

CREATE TABLE livros(
    idLivro INT NOT NULL,
    nomeLivro VARCHAR(45),
    idAutorLivro INT NOT NULL,
    idTipoLivro INT NOT NULL,
    PRIMARY KEY (idAutorLivro , idTipoLivro),
    INDEX(idLivro),
    FOREIGN KEY (idTipoLivro) REFERENCES tipoLivro(idTipo),
    FOREIGN KEY (idAutorLivro) REFERENCES autor(idAutor));

 CREATE TABLE entrada(
    idEentrada INT NOT NULL,
    idEntrada INT NOT NULL,
    idELivro INT NOT NULL,
    dataEmprestimo DATE,
    dataRetorno DATE,
    PRIMARY KEY (idELivro),
    FOREIGN KEY (idEentrada) REFERENCES estudante(idEstudante),
    FOREIGN KEY (idELivro) REFERENCES livros(idLivro));

--Recuperar a tabela livros

SELECT * FROM livros; 
