-- cria novo DB
CREATE DATABASE clinica;

-- usa o DB
use clinica;

-- cria nova tabela
CREATE TABLE paciente (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone VARCHAR(15)
);

-- mostra tabelas
show tables;

-- descreve tabelas
describe paciente;
