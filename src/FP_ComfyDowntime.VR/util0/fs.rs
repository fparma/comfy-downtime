use std::path::Path;
use std::fs::File;
use std::fs::OpenOptions;
use std::error::Error;
use std::io::prelude::*;

use std::io::BufReader;
use regex::Regex;

#[allow(unused_variables)]
pub fn write(pathstring: &str, content: &str) -> bool {
  let path = Path::new(pathstring);

  let mut file = match File::create(&path) {
    Err(why) => {panic!("couldn't create File: {}, File: {:?}", Error::description(&why), &path)}
    Ok(file) => file,
  };

  match file.write_all(content.as_bytes()) {
    Err(_) => false,
    Ok(_) => true,
  }
}

#[allow(unused_must_use)]
pub fn read(path: &Path) -> String {
  let mut content: String = String::new();

  let mut file = match File::open(&path) {
    Err(why) => {panic!("couldn't create File: {}, File: {:?}", Error::description(&why), &path)}
    Ok(file) => file,
  };

  file.read_to_string(&mut content);
  content
}

#[allow(unused_must_use)]
pub fn read_line_regex(path: &Path, regex: &str) -> Vec<String> {
  let f = &File::open(path).unwrap();
  let file = BufReader::new(f);
  let mut matches: Vec<String> = vec![];
  for line in file.lines() {
    let l = line.unwrap();
    let re = Regex::new(regex).unwrap();
    if re.is_match(l.as_ref()) {
      matches.push(l);
    }
  }
  matches
}

#[allow(unused_must_use)]
pub fn append(pathstring: &str, content: &str) -> bool {
  let path = Path::new(pathstring);

  let mut file;
  if path.exists() {
    file = match OpenOptions::new().write(true).append(true).open(&path) {
      Err(why) => {panic!("couldn't create File: {}, File: {:?}", Error::description(&why), &path)}
      Ok(file) => file,
    };
  } else {
    file = match OpenOptions::new().create(true).write(true).append(true).open(&path) {
      Err(why) => {panic!("couldn't create File: {}, File: {:?}", Error::description(&why), &path)}
      Ok(file) => file,
    };
  }

  match file.write_all(content.as_bytes()) {Err(_) => false,Ok(_) => true,}
}
