use std::process::{Command, Stdio};
use util::log::log;
use std::io::Write;

pub struct ProcResult {
  pub success: bool,
  pub message: String,
}

// Starts a new Subprocess with the given arguments and waits until the Process
// exits.

pub fn run(cmd: &str, args: &[&str]) -> ProcResult {
  // Check Command String length
  if cmd.len() <= 0 {return ProcResult { success: false, message: "Error".to_string() };}

  let mut command = Command::new(cmd);
  if args.len() > 0 {command.args(args);}

  log(format!("Debug {:?}", command).as_ref());

  let output = command.output();
  let mut answer_success: bool = false;

  let answer = match output {
    Err(why) => format!("An Error has Happened: {}", why),
    Ok(c) => {answer_success = true;String::from_utf8(c.stdout).unwrap()}
  };

  return ProcResult { success: answer_success, message: answer };
}

#[allow(unused_must_use)]
pub fn run_stdin(cmd: &str, args: &[&str], stdin: &[&str]) {
  let mut command = Command::new(cmd);
  command.stdin(Stdio::piped()).stdout(Stdio::piped());

  // Add all Args from the Array
  if args.len() > 0 {command.args(args);}
  
  let process = match command.spawn() {
    Err(why) => panic!("An Error has Happened while spawning a process: {}", why),
    Ok(process) => process,
  };

  log(format!("Debug {:?}", command).as_ref());

  // Put all the Input String Slices into one big slice blog with a \n at the end of each slice,
  // Indicating an <enter> press in the terminal.
  let mut stdin_blob: String = String::new();
  for s in stdin {stdin_blob = stdin_blob + s + "\n";}

  process.stdin.unwrap().write_all(stdin_blob.as_bytes());
}
