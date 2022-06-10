

CREATE SCHEMA IF NOT EXISTS `proekt` DEFAULT CHARACTER SET utf8 ;
USE `proekt` ;

CREATE TABLE IF NOT EXISTS `proekt`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `proekt`.`channels` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_channels_users_idx` (`users_id` ASC),
  CONSTRAINT `fk_channels_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `proekt`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `proekt`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL,
  `users_id1` INT NOT NULL,
  `users_id2` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_messages_users1_idx` (`users_id1` ASC),
  INDEX `fk_messages_users2_idx` (`users_id2` ASC),
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`users_id1`)
    REFERENCES `proekt`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_users2`
    FOREIGN KEY (`users_id2`)
    REFERENCES `proekt`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `proekt`.`friendships` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id1` INT NOT NULL,
  `users_id2` INT NOT NULL,
  `start` DATE NULL,
  `end` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_friendships_users1_idx` (`users_id1` ASC),
  INDEX `fk_friendships_users2_idx` (`users_id2` ASC),
  CONSTRAINT `fk_friendships_users1`
    FOREIGN KEY (`users_id1`)
    REFERENCES `proekt`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friendships_users2`
    FOREIGN KEY (`users_id2`)
    REFERENCES `proekt`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `proekt`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `channels_id` INT NOT NULL,
  `text` VARCHAR(45) NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_channels1_idx` (`channels_id` ASC),
  INDEX `fk_posts_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_posts_channels1`
    FOREIGN KEY (`channels_id`)
    REFERENCES `proekt`.`channels` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `proekt`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO `proekt`.`users` (`username`, `password`) VALUES ('vgfhfgh', 'dfgdfg');
INSERT INTO `proekt`.`users` (`id`, `username`, `password`) VALUES ('3', 'user12', 'uktc1234');
INSERT INTO `proekt`.`users` (`id`, `username`, `password`) VALUES ('4', 'user14', 'user1234');
INSERT INTO `proekt`.`users` (`id`, `username`, `password`) VALUES ('5', 'user16', 'iskreihsd');
INSERT INTO `proekt`.`users` (`id`, `username`, `password`) VALUES ('6', 'user15', '123456');


INSERT INTO `proekt`.`channels` (`id`, `users_id`) VALUES ('1', '1');
INSERT INTO `proekt`.`channels` (`id`, `users_id`) VALUES ('2', '2');
INSERT INTO `proekt`.`channels` (`id`, `users_id`) VALUES ('3', '3');
INSERT INTO `proekt`.`channels` (`id`, `users_id`) VALUES ('4', '4');
INSERT INTO `proekt`.`channels` (`id`, `users_id`) VALUES ('5', '5');
INSERT INTO `proekt`.`channels` (`id`, `users_id`) VALUES ('6', '6');



INSERT INTO `proekt`.`friendships` (`id`, `users_id1`, `users_id2`, `start`, `end`) VALUES ('1', '1', '1', '2022-07-01', '2022-09-01');
INSERT INTO `proekt`.`friendships` (`id`, `users_id1`, `users_id2`, `start`, `end`) VALUES ('2', '2', '2', '2022-07-02', '2022-0902');
INSERT INTO `proekt`.`friendships` (`id`, `users_id1`, `users_id2`, `start`, `end`) VALUES ('3', '3', '3', '2022-07-03', '2022-09-03');
INSERT INTO `proekt`.`friendships` (`id`, `users_id1`, `users_id2`, `start`, `end`) VALUES ('4', '4', '4', '2022-07-04', '2022-09-04');
INSERT INTO `proekt`.`friendships` (`id`, `users_id1`, `users_id2`, `start`, `end`) VALUES ('5', '5', '5', '2022-07-05', '2022-09-05');
INSERT INTO `proekt`.`friendships` (`id`, `users_id1`, `users_id2`, `start`, `end`) VALUES ('6', '6', '6', '2022-07-06', '2022-09-06');



INSERT INTO `proekt`.`messages` (`id`, `text`, `users_id1`, `users_id2`) VALUES ('1', 'jgjkbk', '1', '1');
INSERT INTO `proekt`.`messages` (`id`, `text`, `users_id1`, `users_id2`) VALUES ('2', 'dgdfg', '2', '2');
INSERT INTO `proekt`.`messages` (`id`, `text`, `users_id1`, `users_id2`) VALUES ('3', 'dfgdg', '3', '3');
INSERT INTO `proekt`.`messages` (`id`, `text`, `users_id1`, `users_id2`) VALUES ('4', 'dgde', '4', '4');
INSERT INTO `proekt`.`messages` (`id`, `text`, `users_id1`, `users_id2`) VALUES ('5', 'fgbd', '5', '5');
INSERT INTO `proekt`.`messages` (`id`, `text`, `users_id1`, `users_id2`) VALUES ('6', 'qeqd', '6', '6');


INSERT INTO `proekt`.`posts` (`id`, `channels_id`, `text`, `users_id`) VALUES ('1', '1', 'sfsdfs', '1');
INSERT INTO `proekt`.`posts` (`id`, `channels_id`, `text`, `users_id`) VALUES ('2', '2', 'sdfsdf', '2');
INSERT INTO `proekt`.`posts` (`id`, `channels_id`, `text`, `users_id`) VALUES ('3', '3', 'sdfsdfs', '3');
INSERT INTO `proekt`.`posts` (`id`, `channels_id`, `text`, `users_id`) VALUES ('4', '4', 'wewef', '4');
INSERT INTO `proekt`.`posts` (`id`, `channels_id`, `text`, `users_id`) VALUES ('5', '5', 'wewee', '5');
INSERT INTO `proekt`.`posts` (`id`, `channels_id`, `text`, `users_id`) VALUES ('6', '6', 'fgsfs', '6');








