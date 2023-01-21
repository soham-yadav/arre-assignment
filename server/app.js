const express = require('express');
const sqlite3 = require('sqlite3').verbose();

const app = express();
const PORT = 3000;

// Group messages placeholder
let groupMessages = [];

const db = new sqlite3.Database('messages.db');


db.run(`CREATE TABLE messages (
    messageId int not null auto_increment,
    groupId int not null,
    userId int not null,
    messageText TEXT,
    mediaUrl TEXT,
    createdAt datetime,
)`);

// API to load all the group messages in a paginated manner
app.get('/group-messages', (req, res) => {
    const page = req.query.page || 1;
    const pageSize = req.query.pageSize || 10;

    const startIndex = (page - 1) * pageSize;
    const endIndex = startIndex + pageSize;

    const paginatedMessages = groupMessages.slice(startIndex, endIndex);
    res.json(paginatedMessages);
});

// API to create a message in the group
app.post('/group-messages', (req, res) => {
    const message = req.body;
    groupMessages.push(message);
    res.json({ message: 'Message added to the group chat' });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
