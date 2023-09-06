module firstsyntax
import IO;
import vis::Text;
import ParseTree;

lexical Num = [0-9]+;
layout WS = [\t-\n\r\ ]*;

syntax Exp = Num 
    > "(" Exp ")" 
    > left Exp "*" Exp
    > left Exp "+" Exp 
    > left Exp "-" Exp;

public void main() {
    str input = "2 * (3 + 4) - 5";
    println("Input: " + input);
    try {
        Exp exp = parse(#Exp, input);
        println("the tree: " + exp);
        println(prettyTree(exp));
    }catch ParseError(loc l): {
        println("Parse error at" + l);
    }
}
