([
   (interpreted_string_literal)
   (raw_string_literal)
 ] @sql
 (#match? @sql "(SELECT|select|INSERT|insert|UPSERT|upsert|UPDATE|update|DELETE|delete).+(FROM|from|INTO|into|VALUES|values|SET|set).*(WHERE|where|GROUP BY|group by)?")
 (#offset! @sql 0 1 0 -1))

