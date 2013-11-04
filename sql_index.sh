mysql -u root -proot -e "use isucon;
CREATE INDEX memo_order_index ON memos(created_at, id); \
CREATE INDEX memo_join_index ON memos(user); \
CREATE INDEX memo_index_pri ON memos(is_private); \
analyze table memos; \
analyze table users; \
"
