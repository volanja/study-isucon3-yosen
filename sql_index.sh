mysql -u root -proot -e "use isucon; \
SELECT memo.id,memo.content,memo.created_at, usr.username FROM memos memo inner join users usr on memo.user = usr.id  WHERE memo.is_private=0 ORDER BY memo.created_at DESC, memo.id DESC LIMIT 100; "
