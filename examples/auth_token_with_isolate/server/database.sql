CREATE TABLE author (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE quote (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  authorId INT(11) UNSIGNED NOT NULL,
  `text` TEXT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (authorId) REFERENCES author(id)
) ENGINE=InnoDB;

INSERT INTO author(firstName, lastName) VALUES
('John', 'Johnson'),
('Martin', 'Fowler'),
('Jason', 'Lengstorf'),
('Linus', 'Torvalds'),
('Robert', 'Martin'),
('Bill', 'Gates'),
('Felipe', 'Fortes'),
('Niels', 'Bohr'),
('Jamie', 'Zawinski');

INSERT INTO quote(authorId, `text`) VALUES
(1, 'First, solve the problem. Then, write the code.'),
(2, 'Any fool can write code that a computer can understand. Good programmers write code that humans can understand.'),
(3, 'If you stop learning, then the projects you work on are stuck in whatever time period you decided to settle.'),
(4, 'Bad programmers worry about the code. Good programmers worry about the data structures and their relationships.'),
(4, 'Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program.'),
(4, 'When you say \'I wrote a program that crashed Windows,\' people just stare at you blankly and say \'Hey, I got those with the system, for free.\''),
(4, 'A computer is like air conditioning - it becomes useless when you open Windows.'),
(4, 'If you think your users are idiots, only idiots will use it.'),
(5, 'You should name a variable using the same care with which you name a first-born child.'),
(6, 'If you are born poor, it is not your mistake, but if you die poor it is your mistake.'),
(6, 'No one will need more than 637Kb of memory for a personal computer.'),
(7, 'Debugging is like being the detective in a crime movie where you are also the murderer.'),
(8, 'An expert is a person who has made all the mistakes that can be made in a very narrow field.'),
(9, 'Some people, when confronted with a problem, think “I know, I’ll use regular expressions.” Now they have two problems.');