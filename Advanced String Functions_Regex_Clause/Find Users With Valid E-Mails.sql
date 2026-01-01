select user_id, name , mail
from Users
where mail collate utf8_bin regexp '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$'
