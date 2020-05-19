-- -------------------------------- --
-- Base de dados do site Gatolândia --
-- -------------------------------- --

-- Apaga o banco de dados caso ele exista
-- ALERTA!!! REMOVA ESTA LINHA APÓS O BANCO ESTAR PRONTO
DROP DATABASE IF EXISTS gatolandia;

-- Cria a base de dados
CREATE DATABASE gatolandia CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona o banco de dados
USE gatolandia;

-- Cria a tabela contatos
CREATE TABLE contatos (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    nome VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL,
    assunto VARCHAR(255) NOT NULL,
    mensagem TEXT NOT NULL,
    campo1 TEXT COMMENT 'Reservado para uso futuro',
    campo2 TEXT COMMENT 'Reservado para uso futuro',
    status ENUM ('recebido', 'lido', 'respondido', 'apagado') DEFAULT 'recebido'
);

--  Cria a tabela autores
CREATE TABLE autores (
    id_autor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    apelido VARCHAR(127) NOT NULL COMMENT 'Nome que aparece no artigo.',
    foto VARCHAR(255) COMMENT 'URL da foto',
    resumo TEXT COMMENT 'Um mini currículo',
    email VARCHAR(127) NOT NULL,
    senha VARCHAR(63) NOT NULL COMMENT 'Senha de acesso ao dashboard.',
    nascimento DATE,
    campo1 TEXT COMMENT 'Reservado para uso futuro',
    campo2 TEXT COMMENT 'Reservado para uso futuro',
    campo3 TEXT COMMENT 'Reservado para uso futuro',
    status ENUM ('inativo', 'ativo') DEFAULT 'ativo'
);

-- Inserção de dados na tabela 'autores'
INSERT INTO autores (nome, apelido, foto, resumo, email, senha, nascimento) VALUES
('Joca da Silva', 'Joca', 'https://randomuser.me/api/portraits/lego/3.jpg', 'Escritor de escrituras escritas.', 'joca@silva.com', '12345', '1990-10-14');


-- ATIVIDADE) Insira pelo menos mais 2 autores
--
INSERT INTO autores (nome, apelido, foto, resumo, email, senha, nascimento) VALUES
('Cristhiane Salles', 'Cris', 'https://randomuser.me/api/portraits/lego/3.jpg', 'Manter-se fiel a si é a condição ideal para o triunfo.Resistir e persistir.', 'crissalles@gmail.com', '12345', '1985-01-31'),
('Lavínia Roberta', 'Lavinia Vivi', 'https://randomuser.me/api/portraits/lego/3.jpg', 'O ontem não é nosso para recuperar, mas o amanhã é nosso para ganhar ou perder.', 'lavinia@gmail.com', '010203', '2008-09-12');


-- Cria a tabela categorias
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(127) NOT NULL
);

-- Inserção de dados na tabela 'categorias'
INSERT INTO categorias (nome) VALUES ('Raças');
INSERT INTO categorias (nome) VALUES ('Pelagem');

-- ATIVIDADE) Insira pelo menos mais 4 categorias
--
INSERT INTO categorias (nome) VALUES ('Brancos'), ('Pretos'), ('Listrados'), ('Malhados');
-- Cria a tabela artigos
CREATE TABLE artigos (
    id_artigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    titulo VARCHAR(255) NOT NULL,
    imagem VARCHAR(255) COMMENT 'URL da imagem - thumbnail',
    resumo VARCHAR(255) NOT NULL COMMENT 'Resumo do artigo',
    texto LONGTEXT NOT NULL COMMENT 'Texto (HTML) do artigo completo',
    autor_id INT NOT NULL,
    campo1 TEXT COMMENT 'Reservado para uso futuro',
    campo2 TEXT COMMENT 'Reservado para uso futuro',
    campo3 TEXT COMMENT 'Reservado para uso futuro',
    status ENUM ('inativo', 'ativo') DEFAULT 'ativo',

    -- Chave estrangeira do autor
    FOREIGN KEY (autor_id) REFERENCES autores (id_autor)
);

-- Inserção de dados na tabela 'artigos'
INSERT INTO artigos (data, titulo, imagem, resumo, texto, autor_id) VALUES
('2020-05-19 14:55:35', 'Primeiro Artigo do Site', 'https://picsum.photos/200', 'Resumo do primeiro artigo do Gatolândia.', '<h2>Proin vestibulum blandit</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>\r\n<a href=\"http://luferat.net/\">Site do Fessô</a>\r\n<p lang=\"en\">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel. Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>\r\n<img class=\"responsivo\" src=\"https://picsum.photos/400/300\" alt=\"Imagem aleatória\">\r\n<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>\r\n<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>', 1);


-- ATIVIDADE) Inserir pelo menos mais 3 artigos
--
INSERT INTO artigos (data, titulo, imagem, resumo, texto, autor_id) VALUES
('2020-05-19 15:17:48', 'Gatos e Seus Donos', 'https://picsum.photos/202', 'orem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie.', '<h2>Proin vestibulum blandit</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>\r\n<a href=\"http://luferat.net/\">Site do Fessô</a>\r\n<p lang=\"en\">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel. Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>\r\n<img class=\"responsivo\" src=\"https://picsum.photos/400/300\" alt=\"Imagem aleatória\">\r\n<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>\r\n<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>', 2),
('2020-05-19 15:18:18', 'Gatos sem Pelo Sentem Frio?', 'https://picsum.photos/201', 'Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim.', '<h2>Proin vestibulum blandit</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>\r\n<a href=\"http://luferat.net/\">Site do Fessô</a>\r\n<p lang=\"en\">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel. Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>\r\n<img class=\"responsivo\" src=\"https://picsum.photos/400/300\" alt=\"Imagem aleatória\">\r\n<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>\r\n<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>\r\n', 3),
('2020-05-19 15:19:16', 'O que Fazer com as Bolas de Pelo', 'https://picsum.photos/199', 'Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus.', '<h2>Proin vestibulum blandit</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>\r\n<a href=\"http://luferat.net/\">Site do Fessô</a>\r\n<p lang=\"en\">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel. Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>\r\n<img class=\"responsivo\" src=\"https://picsum.photos/400/300\" alt=\"Imagem aleatória\">\r\n<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>\r\n<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>\r\n', 1);


-- Cria a tabela de ligação 'artigos' <-> 'categorias'
CREATE TABLE art_cat (
    id_art_cat INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artigo_id INT NOT NULL,
    categoria_id INT NOT NULL,

    -- Chave estrangeira dos artigos
    FOREIGN KEY (artigo_id) REFERENCES artigos (id_artigo),

    -- Chave estrangeira das categorias
    FOREIGN KEY (categoria_id) REFERENCES categorias (id_categoria)    
);

-- Insere dados na tabela 'art_cat'
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (1, 1); -- Artigo 1 na categoria 1
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (1, 2); -- Artigo 1 na categoria 2

-- ATIVIDADE) Cadastre cada artigo em categorias
--
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (2, 5), (2, 2), (3, 3), (3, 1), (4, 3), (4, 5), (3, 5), (2, 4);
