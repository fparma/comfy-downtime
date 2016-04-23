#![allow(unused_must_use)]

extern crate util_kauk_rs;
extern crate walkdir;

use walkdir::WalkDir;
use std::fs;
use util_kauk_rs::cmd::native;
use std::env;
use std::path::Path;

fn main() {
  let version: u8 = 8;  // Version that gets printed into the PBO filename

  let worlds = vec![
    "VR",
    "Sara",
    "SaraLite",
    "Sara_dbe1",
    "Stratis",
    "Chernarus",
    "Chernarus_Summer",
    "Takistan",
    "utes",
    "Zargabad",
    "reshmaan",
    "MCN_Aliabad",
    "IsolaDiCapraia",
    "fata",
    "Caribou",
    "Altis",
    "anim_helvantis_v2",
    "Woodland_ACR",
    "ProvingGrounds_PMC"
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
  native::run("PBOConsole", &["-pack", dirpath.as_ref(), newpath.as_ref()]);
}
