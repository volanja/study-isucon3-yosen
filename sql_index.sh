find /var/lib/mysql/isucon/ -type f |xargs -I % cat %  > /dev/null 

mysql --defaults-extra-file=/home/isucon/webapp/my.cnf -e "use isucon;
ALTER TABLE memos ADD title varchar(255);
update memos set title = substring_index(content,'\n',1);
CREATE INDEX memos_idx_is_private_created_at ON memos (is_private,created_at); \
CREATE INDEX memos_idx_user_created_at ON memos (user,created_at); \
CREATE INDEX memos_idx_user_is_private_created_at ON memos (user,is_private,created_at); \
analyze table memos; \
analyze table users; \
"
