use std::env;
use std::process::exit;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() != 2 {
        eprintln!("引数の数が正しくありません");
        exit(1);
    }

    println!(".globl main");
    println!("main:");
    println!("  mov ${}, %rax", args[1].parse::<i32>().unwrap());
    println!("  ret");
}
