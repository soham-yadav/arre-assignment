CREATE DATABASE whatsapp_group;
SHOW DATABASES;
USE whatsapp_group;

/* Table containing list of all users where a userId is the primary key to identify the user */
CREATE TABLE users (
    userId int not null auto_increment,
    phoneNumber int not null,
    userName varchar(255),
    createdAt datetime,
    updatedAt datetime,
    PRIMARY KEY (userId)
);

/* Table containing list of all groups */
CREATE TABLE grps (
    groupId int not null auto_increment,
    groupName varchar(255),
    membersCount int,
    groupDp varchar(512),
    createdAt datetime,
    updatedAt datetime,
    createdBy varchar(255)
);

/* Table containing list all group members in all groups, forming a many-to-many relation */
CREATE TABLE grp_members (
	Id int not null auto_increment,
    groupId int not null auto_increment,
    userId varchar(255),
    addedAt datetime,
    removedAt datetime,
    PRIMARY KEY (Id),
    FOREIGN KEY (groupId)
    REFERENCES grps(groupId),
    FOREIGN KEY (userId)
    REFERENCES users(userId)
);

/* Table containing list of all messages connecting them to the group they have been sent on and to the user they have been sent to*/
CREATE TABLE messages (
    messageId int not null auto_increment,
    groupId int not null,
    userId int not null,
    messageText varchar(1000),
    mediaUrl varchar(512),
    createdAt datetime,
    PRIMARY KEY (messageId),
    FOREIGN KEY (groupId)
    REFERENCES grps(groupId),
    FOREIGN KEY (userId)
    REFERENCES users(userId)
);
