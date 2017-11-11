#![allow(unused_must_use)]

extern crate regex;
extern crate time;

pub mod fs;
pub mod cmd;
pub mod log;

use std::env;
use std::io;

fn main() {
  let version: u8 = 13;  // Version that gets printed into the PBO filename

  // List of map presets
  let mut fp_main = include!("../maps/fp_main.rs");
  let mut fp_ww2 = include!("../maps/fp_ww2.rs");
  let mut worlds: Vec<&str> = Vec::new();

  // Determine what preset
  let mut buffer = String::new();
  {
    println!("Please Enter your Preset: \n1 = Normal FP Modpack Maps\n2 = WW2 Maps\n3 = FP Modpack + WW2 Maps");
    io::stdin().read_line(&mut buffer).unwrap();
    buffer = buffer.replace("\r", "");
    buffer = buffer.replace("\n", "");

    match buffer.as_ref() {
      "1" =>  {worlds.append(&mut fp_main)},
      "2" =>  {worlds.append(&mut fp_ww2)},
      "3" =>  {
                worlds.append(&mut fp_main);
                worlds.append(&mut fp_ww2);
              },
      _   =>  {},
    }
  }

  let cwd: String = get_cwd();
  for map in worlds {
    compile(cwd.as_ref(), version, map);
  }
}

/// Get Current working directory, where the binary was executed.
fn get_cwd() -> String {
  let pathbuf = env::current_dir().unwrap();
  let path: &str = pathbuf.to_str().unwrap();
  format!("{}\\", path.to_string())
}


/// Function that Generates the new Filename with version info and map postfix
/// and call to PBOConsole for the Basic Medical Mission.
fn compile(path: &str,version: u8, map: &str) {
  let dirpath: String = format!("{}FP_ComfyDowntime.VR", path);
  let newpath: String = format!("{}FP_ComfyDowntime_{}.{}.pbo", path, version, map);
  cmd::native::run("makepbo", &["-N", "-P", dirpath.as_ref(), newpath.as_ref()]);
}
