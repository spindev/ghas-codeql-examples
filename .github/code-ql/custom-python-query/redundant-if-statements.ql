/**
 * @id codeql/custom-python-queries/redundant-if-statements
 * @name spindev's empty blocks
 * @description Find my empty block statements.
 * @kind problem
 * @tags empty
 * @severity warning
 */

import python

from If ifstmt, Stmt pass
where
  pass = ifstmt.getStmt(0) and
  pass instanceof Pass
select ifstmt, "This 'if' statement is redundant."
