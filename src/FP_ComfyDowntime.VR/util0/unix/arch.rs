use util::command;
use util::command::ProcResult;
use util::log::log;

// This Function requires that the Program is run as root (eg. with Sudo)
// Installs the Package given in the Argument onto the System
pub fn install(packages: &str) -> bool {
  let cmd: ProcResult = command::run("pacman", &["-S", packages, "--noconfirm"]);
  if cmd.success {
    log(format!("Success: {}", cmd.message).as_ref());true
  } else {
    log(format!("Error: {}", cmd.message).as_ref());false
  }
}

pub fn chroot_install(packages: &str) -> bool {
  chroot_exec(format!("pacman -S {} --noconfirm", packages).as_ref())
}

// This Function requires that the Program is run as root (eg. with Sudo)
// Starts the Archlinux update process. Updates the Entire System.
pub fn update() -> bool {
  let cmd: ProcResult = command::run("pacman", &["-Syu", "--noconfirm"]);
  if cmd.success {
    log(format!("Success: {}", cmd.message).as_ref());true
  } else {
    log(format!("Error: {}", cmd.message).as_ref());false
  }
}

// Runs a command inside the Arch-Chroot Environment
pub fn chroot_exec(command: &str) -> bool {
  let cmd: ProcResult = command::run("arch-chroot", &["/mnt", "/bin/bash", "-c", command]);
  if cmd.success {
    log(format!("Success: {}", cmd.message).as_ref());true
  } else {
    log(format!("Error: {}", cmd.message).as_ref());false
  }
}
