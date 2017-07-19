use time;

//
// Simple log function for use outside of an installer
// ------------------------------------------------------------
pub fn log(prefix: &str, message: &str) {
  let time = time::now();
  println!("[{}] [{}] => {}", format!("{}:{}:{}", &time.tm_hour, &time.tm_min, &time.tm_sec), prefix, message);
}