use cmd::native;
use cmd::native::ProcResult;
use log::log;

// Execute Bash Statement
pub fn bash_exec(command: &str) -> bool {
  let cmd: ProcResult = native::run("bash", &["-c", command]);
  if cmd.success {
    log("Success", cmd.message.as_ref());true
  } else {
    log("Error", cmd.message.as_ref());false
  }
}
