"Convert PDDL name-with-hyphens to CamelCase type name."
function pddl_to_type_name(name)
    words = split(lowercase(string(name)), '-', keepempty=false)
    return join(uppercasefirst.(words))
end

"Returns a list of pairs from a collection, sorted by key."
sortedpairs(collection) = sort(collect(pairs(collection)), by=first)

"Returns the sorted list of keys for a collection."
sortedkeys(collection) = sort(collect(keys(collection)))

"Generates a switch statement using `if` and `elseif`."
function generate_switch_stmt(cond_exprs, branch_exprs, default_expr=:nothing)
    @assert length(cond_exprs) == length(branch_exprs)
    expr = default_expr
    for i in length(cond_exprs):-1:1
        head = i == 1 ? :if : :elseif
        expr = Expr(head, cond_exprs[i], branch_exprs[i], expr)
    end
    return expr
end
