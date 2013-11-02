mysql -u root -proot -e "use isucon;
CREATE INDEX memo_order_index ON memos(created_at, id); \
CREATE INDEX memo_join_index ON memos(user); \
analyze table memos; \
analyze table users; \
"
