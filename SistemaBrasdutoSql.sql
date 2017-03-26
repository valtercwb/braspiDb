-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sistemabrasduto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistemabrasduto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistemabrasduto` DEFAULT CHARACTER SET utf8 ;
USE `sistemabrasduto` ;

-- -----------------------------------------------------
-- Table `sistemabrasduto`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`categoria` (
  `cat_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `cat_nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`cat_codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`situacaocli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`situacaocli` (
  `sit_cli_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `sit_cli_nome` VARCHAR(45) NOT NULL DEFAULT 'Usuario Padrao',
  PRIMARY KEY (`sit_cli_codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`cliente` (
  `cli_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `cli_nome` VARCHAR(100) NOT NULL,
  `cli_cnpj` VARCHAR(20) NOT NULL,
  `cli_telefone` VARCHAR(40) NOT NULL,
  `cli_email` VARCHAR(60) NOT NULL,
  `cli_status` INT(11) NOT NULL,
  `cli_endereco` VARCHAR(120) NOT NULL,
  `cli_cep` VARCHAR(10) NOT NULL,
  `cli_cidade` VARCHAR(45) NOT NULL,
  `cli_estado` VARCHAR(45) NOT NULL,
  `cli_pais` VARCHAR(45) NOT NULL,
  `cli_data` DATE NOT NULL,
  PRIMARY KEY (`cli_codigo`),
  UNIQUE INDEX `cli_cnpj_UNIQUE` (`cli_cnpj` ASC),
  INDEX `FK_cli_status_idx` (`cli_status` ASC),
  CONSTRAINT `FK_cli_status`
    FOREIGN KEY (`cli_status`)
    REFERENCES `sistemabrasduto`.`situacaocli` (`sit_cli_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`departamento` (
  `dep_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `dep_nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dep_codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`escolaridade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`escolaridade` (
  `esc_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `esc_nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`esc_codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`fun_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`fun_status` (
  `fun_status_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `fun_status_nome` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`fun_status_codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`cidade` (
  `cid_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `cid_nome` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`cid_codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`genero` (
  `gen_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `gen_nome` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`gen_codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`estado` (
  `est_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `est_nome` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`est_codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`estado_civil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`estado_civil` (
  `est_civil_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `est_civil_nome` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`est_civil_codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`pais` (
  `pais_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `pais_nome` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`pais_codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`funcionario` (
  `fun_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `fun_mat` VARCHAR(40) NOT NULL,
  `fun_nome` VARCHAR(100) NOT NULL,
  `fun_genero` INT(5) NOT NULL,
  `fun_data_nasc` DATE NULL DEFAULT NULL,
  `fun_estado_civil` INT(5) NOT NULL,
  `fun_telefone_fixo` VARCHAR(20) NULL,
  `fun_telefone_cel` VARCHAR(45) NULL,
  `fun_email` VARCHAR(45) NULL,
  `fun_endereco` VARCHAR(100) NULL,
  `fun_end_cep` VARCHAR(60) NULL DEFAULT NULL,
  `fun_bairro` VARCHAR(80) NULL,
  `fun_cidade` INT(11) NULL,
  `fun_estado` INT(5) NULL,
  `fun_pais` INT(11) NULL,
  `fun_escolaridade` INT(11) NULL,
  `fun_escDesc` VARCHAR(60) NULL,
  `fun_rg` VARCHAR(60) NOT NULL,
  `fun_cpf` VARCHAR(11) NOT NULL,
  `fun_num_cp` VARCHAR(60) NOT NULL,
  `fun_pis` VARCHAR(60) NOT NULL,
  `fun_cnh` VARCHAR(45) NULL,
  `fun_trans` VARCHAR(45) NULL,
  `fun_status` INT(11) NOT NULL,
  `fun_departamento` INT(11) NOT NULL,
  `fun_cargo` VARCHAR(60) NULL,
  `fun_salario` VARCHAR(60) NULL,
  `fun_data_adm` DATE NOT NULL,
  `fun_data_dem` DATE NULL,
  `fun_foto` BLOB NULL DEFAULT NULL,
  PRIMARY KEY (`fun_codigo`),
  UNIQUE INDEX `fun_cpf_UNIQUE` (`fun_cpf` ASC),
  UNIQUE INDEX `fun_mat_UNIQUE` (`fun_mat` ASC),
  UNIQUE INDEX `fun_rg_UNIQUE` (`fun_rg` ASC),
  UNIQUE INDEX `fun_pis_UNIQUE` (`fun_pis` ASC),
  UNIQUE INDEX `fun_num_cp_UNIQUE` (`fun_num_cp` ASC),
  INDEX `FK_fun_escolaridade_idx` (`fun_escolaridade` ASC),
  INDEX `FK_fun_status_status_idx` (`fun_status` ASC),
  INDEX `FK_fun_departamento` (`fun_departamento` ASC),
  INDEX `Fk_fun_cidade_idx` (`fun_cidade` ASC),
  INDEX `FK_fun_genero_idx` (`fun_genero` ASC),
  INDEX `FK_fun_estado_idx` (`fun_estado` ASC),
  INDEX `FK_fun_estado_civil_idx` (`fun_estado_civil` ASC),
  INDEX `FK_fun_pais_idx` (`fun_pais` ASC),
  CONSTRAINT `FK_fun_departamento`
    FOREIGN KEY (`fun_departamento`)
    REFERENCES `sistemabrasduto`.`departamento` (`dep_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_fun_escolaridade`
    FOREIGN KEY (`fun_escolaridade`)
    REFERENCES `sistemabrasduto`.`escolaridade` (`esc_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_fun_status_status`
    FOREIGN KEY (`fun_status`)
    REFERENCES `sistemabrasduto`.`fun_status` (`fun_status_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_fun_cidade`
    FOREIGN KEY (`fun_cidade`)
    REFERENCES `sistemabrasduto`.`cidade` (`cid_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_fun_genero`
    FOREIGN KEY (`fun_genero`)
    REFERENCES `sistemabrasduto`.`genero` (`gen_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_fun_estado`
    FOREIGN KEY (`fun_estado`)
    REFERENCES `sistemabrasduto`.`estado` (`est_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_fun_estado_civil`
    FOREIGN KEY (`fun_estado_civil`)
    REFERENCES `sistemabrasduto`.`estado_civil` (`est_civil_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_fun_pais`
    FOREIGN KEY (`fun_pais`)
    REFERENCES `sistemabrasduto`.`pais` (`pais_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`compra` (
  `com_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `com_nota` INT(11) NOT NULL,
  `com_funcionario` INT(11) NOT NULL,
  `com_data` DATE NOT NULL,
  PRIMARY KEY (`com_codigo`),
  UNIQUE INDEX `com_nota_UNIQUE` (`com_nota` ASC),
  INDEX `FK_com_funcionario_idx` (`com_funcionario` ASC),
  CONSTRAINT `FK_com_funcionario`
    FOREIGN KEY (`com_funcionario`)
    REFERENCES `sistemabrasduto`.`funcionario` (`fun_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`fornecedor` (
  `for_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `for_nome` VARCHAR(120) NOT NULL,
  `for_cnpj` VARCHAR(20) NOT NULL,
  `for_telefone` VARCHAR(30) NOT NULL,
  `for_email` VARCHAR(45) NOT NULL,
  `for_contato` VARCHAR(100) NULL DEFAULT NULL,
  `for_tipo_material` VARCHAR(45) NOT NULL,
  `for_endereco` VARCHAR(100) NOT NULL,
  `for_cep` VARCHAR(10) NOT NULL,
  `for_bairro` VARCHAR(45) NOT NULL,
  `for_cidade` VARCHAR(45) NOT NULL,
  `for_estado` VARCHAR(45) NOT NULL,
  `for_pais` VARCHAR(45) NOT NULL,
  `for_data` DATE NOT NULL,
  PRIMARY KEY (`for_codigo`),
  UNIQUE INDEX `for_cnpj_UNIQUE` (`for_cnpj` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`material` (
  `mat_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `mat_nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mat_codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`insumo` (
  `ins_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `ins_code` VARCHAR(60) NOT NULL,
  `ins_nome` VARCHAR(60) NOT NULL,
  `ins_local` VARCHAR(60) NOT NULL,
  `ins_material` INT(11) NOT NULL,
  `ins_setor` INT(11) NOT NULL,
  `ins_fornecedor` INT(11) NOT NULL,
  `ins_preco` VARCHAR(10) NOT NULL,
  `ins_quantidade` INT(11) NOT NULL,
  `ins_qtd_uso_diario` INT(11) NOT NULL,
  `ins_peso` VARCHAR(30) NOT NULL,
  `ins_dimensao` VARCHAR(45) NOT NULL,
  `ins_data` DATE NOT NULL,
  `ins_image` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`ins_codigo`),
  UNIQUE INDEX `item_mat_UNIQUE` (`ins_code` ASC),
  INDEX `FK_ins_material_idx` (`ins_material` ASC),
  INDEX `FK_ins_fornecedor_idx` (`ins_fornecedor` ASC),
  INDEX `FK_ins_departamento_idx` (`ins_setor` ASC),
  CONSTRAINT `FK_ins_fornecedor`
    FOREIGN KEY (`ins_fornecedor`)
    REFERENCES `sistemabrasduto`.`fornecedor` (`for_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ins_material`
    FOREIGN KEY (`ins_material`)
    REFERENCES `sistemabrasduto`.`material` (`mat_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ins_departamento`
    FOREIGN KEY (`ins_setor`)
    REFERENCES `sistemabrasduto`.`departamento` (`dep_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 39
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`itens_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`itens_compra` (
  `com_codigo` INT(11) NOT NULL,
  `ins_codigo` INT(11) NOT NULL,
  `qtd_insumo` INT(10) NOT NULL,
  `valor_compra` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`com_codigo`, `ins_codigo`),
  INDEX `fk_Compra_has_Insumo_Insumo1_idx` (`ins_codigo` ASC),
  INDEX `fk_Compra_has_Insumo_Compra1_idx` (`com_codigo` ASC),
  CONSTRAINT `fk_Compra_has_Insumo_Compra1`
    FOREIGN KEY (`com_codigo`)
    REFERENCES `sistemabrasduto`.`compra` (`com_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_has_Insumo_Insumo1`
    FOREIGN KEY (`ins_codigo`)
    REFERENCES `sistemabrasduto`.`insumo` (`ins_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`produto` (
  `pro_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `pro_mat` VARCHAR(60) NOT NULL,
  `pro_nome` VARCHAR(100) NOT NULL,
  `pro_categoria` INT(11) NOT NULL,
  `pro_acabamento` VARCHAR(45) NOT NULL,
  `pro_quantidade` VARCHAR(20) NOT NULL,
  `pro_dimensao` VARCHAR(45) NOT NULL,
  `pro_peso` VARCHAR(45) NOT NULL,
  `pro_preco_custo` VARCHAR(15) NOT NULL,
  `pro_preco_venda` VARCHAR(15) NOT NULL,
  `pro_data` DATE NOT NULL,
  `pro_foto` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`pro_codigo`),
  UNIQUE INDEX `pro_mat_UNIQUE` (`pro_mat` ASC),
  INDEX `FK_pro_categoria_idx` (`pro_categoria` ASC),
  CONSTRAINT `FK_pro_categoria`
    FOREIGN KEY (`pro_categoria`)
    REFERENCES `sistemabrasduto`.`categoria` (`cat_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`venda` (
  `ven_codigo` INT(11) NOT NULL,
  `ven_nota_cod` INT(11) NOT NULL,
  `ven_quantidade` INT(11) NOT NULL,
  `ven_cliente` INT(11) NOT NULL,
  `ven_funcionario` INT(11) NOT NULL,
  `ven_data` DATE NOT NULL,
  `ven_valor` VARCHAR(18) NOT NULL,
  `ven_pago` TINYINT(1) NOT NULL DEFAULT '1',
  `ven_tipo` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`ven_codigo`),
  UNIQUE INDEX `ven_nota_cod_UNIQUE` (`ven_nota_cod` ASC),
  INDEX `FK_ven_cliente_idx` (`ven_cliente` ASC),
  INDEX `FK_ven_funcionario_idx` (`ven_funcionario` ASC),
  CONSTRAINT `FK_ven_cliente`
    FOREIGN KEY (`ven_cliente`)
    REFERENCES `sistemabrasduto`.`cliente` (`cli_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ven_funcionario`
    FOREIGN KEY (`ven_funcionario`)
    REFERENCES `sistemabrasduto`.`funcionario` (`fun_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`itens_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`itens_venda` (
  `ven_codigo` INT(11) NOT NULL,
  `pro_codigo` INT(11) NOT NULL,
  `qtd_produto` INT(10) NOT NULL,
  `valor` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`ven_codigo`, `pro_codigo`),
  INDEX `fk_Venda_has_Produto_Produto1_idx` (`pro_codigo` ASC),
  INDEX `fk_Venda_has_Produto_Venda1_idx` (`ven_codigo` ASC),
  CONSTRAINT `fk_Venda_has_Produto_Produto1`
    FOREIGN KEY (`pro_codigo`)
    REFERENCES `sistemabrasduto`.`produto` (`pro_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_has_Produto_Venda1`
    FOREIGN KEY (`ven_codigo`)
    REFERENCES `sistemabrasduto`.`venda` (`ven_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`tipo_usuario` (
  `tipo_usu_codigo` INT(11) NOT NULL,
  `tipo_usu_nome` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`tipo_usu_codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`usuario` (
  `usu_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `usu_nome` VARCHAR(60) NOT NULL,
  `usu_login` VARCHAR(45) NOT NULL,
  `usu_senha` VARCHAR(45) NOT NULL,
  `usu_tipo` INT NULL,
  `usu_status` ENUM('0', '1') NULL DEFAULT '1',
  PRIMARY KEY (`usu_codigo`),
  INDEX `FK_usuario_tipo_idx` (`usu_tipo` ASC),
  CONSTRAINT `FK_usuario_tipo`
    FOREIGN KEY (`usu_tipo`)
    REFERENCES `sistemabrasduto`.`tipo_usuario` (`tipo_usu_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sistemabrasduto`.`adm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemabrasduto`.`adm` (
  `adm_codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `adm_nome` VARCHAR(60) NOT NULL,
  `adm_login` VARCHAR(45) NOT NULL,
  `usu_senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`adm_codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
