let license = variable::get("license");

while switch license.to_upper() 
{
  "APACHE 2.0" => {
    file::rename("LICENSE-APACHE", "LICENSE");
    file::delete("LICENSE-GPL3");
    file::delete("LICENSE-GPL3-R");
    file::delete("LICENSE-LGPL3");
    file::delete("LICENSE-MIT");
    false
  },
  "MIT" => {
    file::rename("LICENSE-MIT", "LICENSE");
    file::delete("LICENSE-GPL3");
    file::delete("LICENSE-GPL3-R");
    file::delete("LICENSE-LGPL3");
    file::delete("LICENSE-APACHE");
    false
  },
  "LGPL V3" => {
    file::rename("LICENSE-LGPL3", "LICENSE");
    file::delete("LICENSE-GPL3");
    file::delete("LICENSE-GPL3-R");
    file::delete("LICENSE-MIT");
    file::delete("LICENSE-APACHE");
    false
  },
  "GPL V3" => {
    file::rename("LICENSE-GPL3", "LICENSE");
    file::delete("LICENSE-LGPL3");
    file::delete("LICENSE-GPL3-R");
    file::delete("LICENSE-MIT");
    file::delete("LICENSE-APACHE");
    false
  },
  "GPL V3 (WITH RELOADED FAQ)" => {
    file::rename("LICENSE-GPL3-R", "LICENSE");
    file::delete("LICENSE-LGPL3");
    file::delete("LICENSE-GPL3");
    file::delete("LICENSE-MIT");
    file::delete("LICENSE-APACHE");
    false
  },
  _ => true,
} {
  license = variable::prompt("What license to use?", "GPL v3 (with Reloaded FAQ)", [
    "GPL v3 (with Reloaded FAQ)",
    "GPL v3",    
    "LGPL v3",
    "Apache 2.0",
    "MIT",
  ]);
}

variable::set("license", license);