#![allow(unused_must_use)]

extern crate util_kauk_rs;
extern crate walkdir;

use walkdir::WalkDir;
use std::fs;
use util_kauk_rs::cmd::native;
use std::env;
use std::path::Path;

fn main() {
  let version: u8 = 10;  // Version that gets printed into the PBO filename

  let worlds = vec![
    "abel",
    "Altis",
    "Bootcamp_ACR",
    "cain",
    "Chernarus",
    "Chernarus_Summer",
    "Desert_E",
    "Desert_Island",
    "eden",
    "mbg_celle2",
    "Mountains_ACR",
    "Napf",
    "NapfWinter",
    "noe",
    "Porto",
    "ProvingGrounds_PMC",
    "Sara",
    "Sara_dbe1",
    "SaraLite",
    "Shapur_BAF",
    "Stratis",
    "Takistan",
    "Tanoa",
    "utes",
    "VR",
    "Woodland_ACR",
    "Zargabad"
  ];

  let cwd: String = get_cwd();

  for map in worlds {
    compile(cwd.as_ref(), version, map);
  }
}

/*
  Get Current working directory, where the binary was executed.
*/
fn get_cwd() -> String {
  let pathbuf = env::current_dir().unwrap();
  let path: &str = pathbuf.to_str().unwrap();
  format!("{}\\", path.to_string())
}

/*
  Function that Generates the new Filename with version info and map postfix
  and call to PBOConsole for the Basic Medical Mission.
*/
fn compile(path: &str,version: u8, map: &str) {
  let dirpath: String = format!("{}FP_ComfyDowntime.VR", path);
  let newpath: String = format!("{}FP_ComfyDowntime_{}.{}.pbo", path, version, map);
  //native::run("PBOConsole", &["-pack", dirpath.as_ref(), newpath.as_ref()]);
  native::run("makepbo", &["-N", "-P", dirpath.as_ref(), newpath.as_ref()]);
}
