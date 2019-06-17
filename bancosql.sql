CREATE SCHEMA IF NOT EXISTS `prova` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`empresa`
-- -----------------------------------------------------
CREATE TABLE empresa (
  id INT NOT NULL AUTO_INCREMENT,
  nomeFantasia VARCHAR(100) NOT NULL,
  razaoSocial VARCHAR(100) NOT NULL,
 cnpj VARCHAR(20) NOT NULL,
  PRIMARY KEY (id));


-- -----------------------------------------------------
-- Table `mydb`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE pessoa (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  sexo CHAR(1) NOT NULL,
  dataNascimento DATE NOT NULL,
  usuario VARCHAR(45) NOT NULL,
  senha DOUBLE NOT NULL,
  tipo CHAR(1) NOT NULL,
  foto VARCHAR(100) NULL,
  empresa_id INT NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (empresa_id)
    REFERENCES prova.empresa (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`classificacao`
-- -----------------------------------------------------
CREATE TABLE classificacao (
  id INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(50) NOT NULL,
  faixaInicial FLOAT NOT NULL,
  faixaFinal FLOAT NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`avaliacao`
-- -----------------------------------------------------
CREATE TABLE avaliacao(
  id INT NOT NULL AUTO_INCREMENT,
  data DATE NOT NULL,
  peso FLOAT NOT NULL,
  altura FLOAT NOT NULL,
  imc FLOAT NOT NULL,
  classificacao VARCHAR(45) NULL,
  pessoa_id INT NOT NULL,
  classificacao_id INT NOT NULL,
  PRIMARY KEY (id),
 
    FOREIGN KEY (pessoa_id)
    REFERENCES prova.pessoa (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
 
    FOREIGN KEY (classificacao_id)
    REFERENCES prova.classificacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
