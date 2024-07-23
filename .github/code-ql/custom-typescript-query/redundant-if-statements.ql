/**
 * @id codeql/custom-typescript-queries/redundant-if-statements
 * @name spindev's empty blocks
 * @description Find my empty block statements.
 * @kind problem
 * @tags empty
 * @severity warning
 */

import javascript

predicate isRedundantIf(IfStmt ifStmt) {
  exists(BooleanLiteral lit |
    lit.getValue() = false and
    lit = ifStmt.getCondition()
  )
}

from IfStmt ifStmt
where isRedundantIf(ifStmt)
select ifStmt, "This if statement is redundant and always evaluates to false."
