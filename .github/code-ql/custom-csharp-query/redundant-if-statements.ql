/**
 * @id codeql/custom-csharp-queries/redundant-if-statements
 * @name spindev's empty blocks
 * @description Find my empty block statements.
 * @kind problem
 * @tags empty
 * @severity warning
 */

import csharp

from IfStmt ifstmt, BlockStmt block
where
  ifstmt.getThen() = block and
  block.isEmpty()
select ifstmt, "This 'if' statement is redundant."
