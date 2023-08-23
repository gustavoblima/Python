CREATE TABLE estudante(
    idEstudante INT NOT NULL,
    nome VARCHAR(45) NULL,
    ultimoNome VARCHAR(45) NULL,
    turma INT NULL,
    idade INT NULL,
    PRIMARY KEY (idEstudante));

CREATE TABLE  tipoLivro (
    idTipo INT NOT NULL,
    nomeTipo VARCHAR(45) NULL,
    PRIMARY KEY (idTipo));

 CREATE TABLE autor(
    idAutor INT NOT NULL,
    nomeAutor VARCHAR(45) NULL,
    ultimoNomeAutor VARCHAR(45) NULL,
    PRIMARY KEY (idAutor));

CREATE TABLE livro(
    idLivro INT NOT NULL,
    nomeLivro VARCHAR(45) NULL,
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
    dataEmprestimo DATE NULL,
    dataRetorno DATE NULL,
    PRIMARY KEY (idELivro),
    FOREIGN KEY (idEentrada) REFERENCES student(idEstudante),
    FOREIGN KEY (idELivro) REFERENCES (idLivro));