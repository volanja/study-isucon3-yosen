find /var/lib/mysql/isucon/ -type f |xargs -I % cat %  > /dev/null 

mysql --defaults-extra-file=/home/isucon/webapp/my.cnf -e "use isucon;
ALTER TABLE memos ADD title varchar(255);
update memos set title = substring_index(content,'\n',1);
DROP TABlE IF EXISTS public_memos;
CREATE TABLE public_memos (
	id INT NOT NULL AUTO_INCREMENT,
	memo int DEFAULT NULL,
	PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
ALTER TABLE public_memos AUTO_INCREMENT = 1;
INSERT INTO public_memos (memo) SELECT id FROM memos 
WHERE is_private=0 ORDER BY created_at ASC, id ASC;
CREATE INDEX memos_idx_is_private_created_at ON memos (is_private,created_at); \
CREATE INDEX memos_idx_user_created_at ON memos (user,created_at); \
CREATE INDEX memos_idx_user_is_private_created_at ON memos (user,is_private,created_at); \
analyze table memos; \
analyze table users; \
"
sudo echo '' > /var/lib/mysql/slow-query.log
sudo service memcached restart
sudo service supervisord restart
sleep 5
