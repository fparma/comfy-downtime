fn main() {
  let worlds = vec![
    "VR",
    "utes",
    "Sara",
    "SaraLite",
    "Sara_dbe1",
    "Chernarus",
    "Chernarus_Summer",
    "Porto",
    "IsolaDiCapraia",
    "Mountains_ACR",
    "Takistan",
    "Zargabad",
    "Woodland_ACR",
    "Bootcamp_ACR",
    "Desert_E",
    "ProvingGrounds_PMC",
    "Shapur_BAF",
    "fata",
    "Stratis",
    "anim_helvantis_v2",
    "Altis",
    "pja310"
  ];
  
  let cwd: String = get_cwd();
  for map in worlds {
    println!("Generating missions for Map: {}", map);
    println!("{}", cwd);
    // compile_comfyDowntime(cwd.as_ref(), map);
    // compile_comfyCompetition(cwd.as_ref(), map);
  }
}

fn get_cwd() -> String {
  let pathbuf = env::current_dir().unwrap();
  let path: &str = pathbuf.to_str().unwrap();
  format!("{}\\", path.to_string())
}